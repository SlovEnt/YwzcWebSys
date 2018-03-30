import os
import sys
import time
import datetime
import json
from subprocess import PIPE, Popen

os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
from apps.commset.GetSysInfo import mySqlConn

from apps.runscripts.Ext_Functions.CommFuncs import RedisQueue, C_PrintLog, Comp_MultilineText

from apps.runscripts.Ext_Functions.FilesCut2Nas_Srv import Get_File_MD5, Get_File_Size, NetRemoteDisk2LocakDisk

import shutil

def MoveFile2NAS(singFile, newPath):
    while 1 :
        try:
            shutil.move(singFile, newPath)
            return True
        except Exception as e:
            strErrInfo = str(e)
            if "Destination path" in strErrInfo and "already exists" in strErrInfo:
                errFileName = os.path.basename(singFile)
                delFileName = newPath + "\\" + errFileName  # 重组已存在的文件路径，准备删除后重新拷贝
                os.remove(delFileName)
                print(C_PrintLog.debug(), errFileName, "目的端已存在同名文件，%s 将其删除!" % delFileName)
            elif "Permission denied" in strErrInfo:
                return strErrInfo
                # cmdRtn = Popen("del /f/s/q %s" % singFile, stdout=PIPE, stderr=PIPE)
                # print(cmdRtn.read())
            else:
                return strErrInfo

def Create_New_Sub_dir(newPath):
    '''  如果NAS上没有要切转的目录，则创建 '''
    try:
        if os.path.exists(newPath) == False:
            os.makedirs(newPath)
    except Exception as e:
        pass

def CopyFile2NasMain(copyParams, nasNetLetter):
    x = copyParams
    strSql = ""
    fileMd5Code = Get_File_MD5(x["nat_path_file"])
    fileSize = Get_File_Size(x["nat_path_file"])
    fileDir, fileName = os.path.split(x["orig_path_file"])

    remarkDict = {}
    if x["rule"] == "0":
        # 组装新的归档目录文件路径
        newPathFile = x["nat_path_file"].replace("\\\\", "%s\\" % (nasNetLetter))
        newPathFileTwo = x["nat_path_file"].replace("\\\\%s" % (x["host_ip"]), "%s\\%s" % (x["arch_nas_path"],x["host_ip"]))

        newPath = os.path.dirname(newPathFile)

        # 多任务机制下可能会出现子进程抢着创建目录的情况，特使用单独函数创建子目录，防止程序异常跳出
        Create_New_Sub_dir(newPath)

        if os.path.isfile(x["nat_path_file"]) == True:
            remarkMsg = "%s %s %s 文件满足归档要求，正在执行迁移命令！！" % (fileMd5Code, x["host_ip"], x["orig_path_file"])
            remarkDict["remark_msg"] = remarkMsg
            print(C_PrintLog.debug(),remarkMsg)
            copyRtnMsg = MoveFile2NAS(x["nat_path_file"], newPathFile)
            if copyRtnMsg == True:
                remarkCmd = "echo f|xcopy /s/f %s %s" % (newPathFileTwo, x["nat_path_file"])
                remarkDict["retracement_cmd"] = remarkCmd

                strSql = '''
                    INSERT INTO `backtaskmget_filebacktasklog` (
                        `task_name`,
                        `task_run_date`,
                        `task_run_time`,
                        `host_ip`,
                        `file_modify_dt`,
                        `md5_string`,
                        `file_name`,
                        `file_save_path`,
                        `arch_nas_path`,
                        `file_siz`,
                        `remark`
                    )
                    VALUES
                        (
                            '%s',
                            '%s',
                            '%s',
                            '%s',
                            '%s',
                            '%s',
                            '%s',
                            '%s',
                            '%s',
                            '%s',
                            '%s'
                        );
                ''' % (
                    x["task_name"],
                    datetime.datetime.now().strftime('%Y-%m-%d'),
                    datetime.datetime.now().strftime('%H:%M:%S'),
                    x["host_ip"],
                    x["file_mod_time"],
                    fileMd5Code,
                    fileName,
                    fileDir,
                    newPathFileTwo,
                    fileSize,
                    json.dumps(remarkDict, ensure_ascii=False),
                )
                # print(C_PrintLog.debug(), Comp_MultilineText(strSql.replace("\\", "\\\\")))
                mySqlConn.execute(strSql.replace("\\", "\\\\"))


    else:
        ''' 写一条忽略日志 '''
        remarkDict["remark_msg"] = "%s %s %s 文件匹配策略[%s]成功，跳过归档任务！！" % (fileMd5Code, x["host_ip"], x["orig_path_file"], x["rule"])

        strSql = '''
            SELECT
                count(*) AS cnt
            FROM
                `backtaskmget_filebacktasklog`
            WHERE
            0=0
            AND host_ip = '%s'
            AND md5_string = '%s'
            AND file_name = '%s'
            AND file_save_path = '%s'
        ''' % (
            x["host_ip"],
            fileMd5Code,
            fileName,
            fileDir,)
        rtnCnt = mySqlConn.query(strSql.replace("\\","\\\\"))[0]

        if rtnCnt["cnt"] == 0:
            strSql = '''
                INSERT INTO `backtaskmget_filebacktasklog` (
                    `task_name`,
                    `task_run_date`,
                    `task_run_time`,
                    `host_ip`,
                    `file_modify_dt`,
                    `md5_string`,
                    `file_name`,
                    `file_save_path`,
                    `arch_nas_path`,
                    `file_siz`,
                    `remark`
                )
                VALUES
                    (
                        '%s',
                        '%s',
                        '%s',
                        '%s',
                        '%s',
                        '%s',
                        '%s',
                        '%s',
                        '%s',
                        '%s',
                        '%s'
                    );
            ''' % (
                x["task_name"],
                datetime.datetime.now().strftime('%Y-%m-%d'),
                datetime.datetime.now().strftime('%H:%M:%S'),
                x["host_ip"],
                x["file_mod_time"],
                fileMd5Code,
                fileName,
                fileDir,
                "",
                fileSize,
                json.dumps(remarkDict, ensure_ascii=False),
            )
            print(C_PrintLog.tmpinfo(),remarkDict["remark_msg"])
            mySqlConn.execute(strSql.replace("\\","\\\\"))


if __name__ == "__main__" :

    # 获取 redis 连接参数
    redisConnStr = "REDIS_192.168.169.30_FileCut"
    strSql = "select param_value from commset_sysparam a where a.param_en_name='%s';" % (redisConnStr)
    redisParam = mySqlConn.query(strSql)
    redisParamArr = redisParam[0]["param_value"].split("//")[1].split(",")
    namespace = redisParamArr[1]
    name = redisParamArr[2]
    hostip = redisParamArr[0].split(":")[0]
    port = redisParamArr[0].split(":")[1].split("/")[0]
    db = redisParamArr[0].split(":")[1].split("/")[1]
    redisQ = RedisQueue(name, namespace, hostip, port, db)

    while True:

        copyParams = redisQ.get_nowait()

        if copyParams:

            copyParams = eval(copyParams.decode("utf-8"))

            rtnMsg = NetRemoteDisk2LocakDisk(copyParams["arch_nas_path"], copyParams["arch_nas_user"], copyParams["arch_nas_passwd"])
            CopyFile2NasMain(copyParams,rtnMsg["msg"])



