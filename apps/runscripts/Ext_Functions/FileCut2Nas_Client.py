import os
import datetime
import json
from multiprocessing import Pool
import time
import traceback

os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
from apps.commset.GetSysInfo import mySqlConn

from apps.runscripts.Ext_Functions.CommFuncs import C_PrintLog, Comp_MultilineText, Net_RemtePath_IsAccess, \
    DateEncoder, RedisQueue, Print_Dict_KandV

from apps.runscripts.Ext_Functions.FileCut2Nas_Comm import CopyHostFileClass


def __Client_Sub_Move_Main(redisReqKeyName):

    hostList = []

    while True:

        RedisR = RedisQueue("req", redisReqKeyName, "192.168.169.30", 6379, 1)

        if RedisR.qsize() == 0:
            break

        copyParams = RedisR.get_wait()[1]  # 返回为元祖，原始入参字典在第二个顺位
        # copyParams = RedisR.get_nowait()  # 返回为字典

        strSql = ""

        if copyParams:

            # 缺一段逻辑，用于增加对hostip只判断一次是否可以访问的函数
            pass

            # 对入参进行解码
            x = eval(copyParams.decode("utf-8"))

            archNasPath = x["arch_nas_path"]
            archNasPathUser = x["arch_nas_user"]
            archNasPathUserPasswd = x['arch_nas_passwd']
            rtnResult = Net_RemtePath_IsAccess(archNasPath, archNasPathUser, archNasPathUserPasswd)
            if rtnResult != True:
                x["run_status"] = "3"
                x["run_msg"] = "10001：NAS 服务器访问错误，请检查！"
                raise Exception(rtnResult)

            fileUncPath = x["unc_access_base_path"]
            fileUncUser = x["host_user"]
            fileUncUserPasswd = x["host_user_passwd"]
            rtnResult = Net_RemtePath_IsAccess(fileUncPath, fileUncUser, fileUncUserPasswd)
            if rtnResult != True:
                x["run_status"] = "3"
                x["run_msg"] = "1002：文件目标服务器UNC访问错误，请检查！"
                raise Exception(rtnResult)

            # 引入核心参数
            chfc = CopyHostFileClass(x, RedisR, mySqlConn)

            # 运行文件拷贝编码进程
            chfc.Copy_File2Nas_Main()

            strSql = """
                INSERT INTO `backtaskmget_filebacktasklog` (
                    `task_name`,
                    `task_status`,
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
                        '%s',
                        '%s'
                    );
            """ % (
                x["task_name"],
                x["run_status"],
                datetime.datetime.now().strftime('%Y-%m-%d'),
                datetime.datetime.now().strftime('%H:%M:%S'),
                x["host_ip"],
                x["file_mod_time"],
                x["file_md5_code"],
                x["c_local_file_name"],
                x["c_local_file_dir"],
                x["nas_new_file_path"],
                x["file_size"],
                json.dumps(x, cls=DateEncoder, ensure_ascii=False),
            )
            # print(C_PrintLog.debug(), Comp_MultilineText(strSql.replace("\\", "\\\\")))
            mySqlConn.execute(strSql.replace("\\", "\\\\"))

if __name__ == "__main__" :

    try:

        while True:

            ''' 获取 任务运行参数 '''
            sqlStr = "select * from backtaskmget_filebacktaskset where proc_flag = 'Y';"
            xList = mySqlConn.query(sqlStr)

            p = Pool(5)

            for x in xList:
                # RedisR = RedisQueue("req", x["id"], "192.168.169.30", 6379, 1)
                redisReqKeyName = x["id"]
                # __Client_Sub_Move_Main(redisReqKeyName)
                p.apply_async(__Client_Sub_Move_Main, args=(redisReqKeyName,))

            p.close()
            p.join()

            time.sleep(1)

    except Exception as e:
        print(C_PrintLog.errinfo(), e)

        traceback.print_exc()






                # CopyFile2NasMain(copyParams,rtnMsg["msg"])

                # chfc = CopyHostFileClass(copyParams, RedisR)




