import os
import sys
import time
import datetime
import json
from subprocess import PIPE, Popen
import schedule
import threading
from multiprocessing import Pool

os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
from apps.commset.GetSysInfo import mySqlConn
from apps.runscripts.Ext_Functions.CommFuncs import RedisQueue, C_PrintLog

# 获取 redis 连接参数
redisConnStr = "REDIS_192.168.169.30_FileCut"
sqlStr = "select param_value from commset_sysparam a where a.param_en_name='%s';" % (redisConnStr)
redisParam = mySqlConn.query(sqlStr)
redisParamArr = redisParam[0]["param_value"].split("//")[1].split(",")
namespace = redisParamArr[1]
name = redisParamArr[2]
hostip = redisParamArr[0].split(":")[0]
port = redisParamArr[0].split(":")[1].split("/")[0]
db = redisParamArr[0].split(":")[1].split("/")[1]
redisQ = RedisQueue(name, namespace, hostip, port, db)

def RunMainPoint(x):

    for key, value in x.items():
        print ("x['{0}'] = {1}".format(key, value))

    archNasPath = x["arch_nas_path"]
    archNasPathUser = x["arch_nas_user"]
    archNasPathUserPasswd = x['arch_nas_passwd']
    # print(archNasPath)
    rtnResult = NetRemoteDisk2LocakDisk(archNasPath, archNasPathUser, archNasPathUserPasswd)

    if rtnResult["result"] == True :
        ''' 判断目的服务器上的相关信息 '''

        # 把新增的NAS盘符送入字典中处理
        x["nas_net_lettel"] = rtnResult["msg"]

        chfc = CopyHostFileClass(x,redisQ)

        rtnResult = chfc.SpyingHost()

        if rtnResult["result"] == False:

            ''' 写一条错误日志 '''
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
                datetime.datetime.now().strftime('1900-01-01 00:00:00.000000'),
                "",
                "",
                "",
                x["arch_nas_path"],
                0,
                json.dumps(rtnResult, ensure_ascii=False),
            )
            mySqlConn.execute(strSql)

        else:
            ''' 基本条件已具备，可以进行文件切转函数操作 '''

            excludList = chfc.Get_ExcludeList(mySqlConn)
            chfc.Move_File_Proc(excludList)
            # print(copyParam)

    else:
        ''' 写一条错误日志 '''
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
            datetime.datetime.now().strftime('1900-01-01 00:00:00.000000'),
            "",
            "",
            "",
            x["arch_nas_path"],
            0,
            json.dumps(rtnResult, ensure_ascii=False),
        )
        mySqlConn.execute(strSql)

class CopyHostFileClass(object):

    def __init__(self, taskDictInfo, redisQ):
        self.taskDictInfo = taskDictInfo
        self.taskName = taskDictInfo["task_name"]
        self.hostIp = taskDictInfo["host_ip"]
        self.hostUser = taskDictInfo["host_user"]
        self.hostUserPasswd = taskDictInfo['host_user_passwd']
        self.fileSavePath = taskDictInfo['file_save_path']
        self.archNasPath = taskDictInfo['arch_nas_path']
        self.reservedDay = taskDictInfo['reserved_day']
        self.rtnResult = {}

        self.redisQ = redisQ

    def GenLegaPath(self,):
        ''' 生成合法路径 '''
        return r'\\%s\%s' % (self.hostIp, self.fileSavePath.replace(":","$"))

    def SpyingHost(self):
        legalPath = self.GenLegaPath()
        strCmd = r"net use %s %s /user:%s" % (legalPath, self.hostUserPasswd, self.hostUser)
        rtnCmdMsg = Popen(strCmd, shell=True, stdout=PIPE, stderr=PIPE)
        out, err = rtnCmdMsg.communicate()

        if not out.decode("gb2312") :
            if "1219" in err.decode("gb2312"):
                ''' 取消用户名和密码进行一次直接连接 '''
                strCmd = r"net use %s" % (legalPath)
                rtnCmdMsg = Popen(strCmd, shell=True, stdout=PIPE, stderr=PIPE)
                out, err = rtnCmdMsg.communicate()
                if not out.decode("gb2312"):
                    self.rtnResult["msg"] = "多次重连失败"
                    self.rtnResult["no"] = "100001"
                    self.rtnResult["result"] = False

                    return self.rtnResult

                else :

                    self.rtnResult["result"] = True
                    return self.rtnResult

            else:

                self.rtnResult["msg"] = err.decode("gb2312").replace("\n","").replace("\r","")
                self.rtnResult["no"] = "100002"
                self.rtnResult["result"] = False
                return self.rtnResult

        else:
            self.rtnResult["result"] = True
            return self.rtnResult

    def Get_ExcludeList(self, mySqlConn):
        strSql = '''
            SELECT
                b.exclude_list
            FROM
                backtaskmget_filebacktaskset a
            INNER JOIN backtaskmget_filebacktaskexcludeset b ON a.id = b.task_name_id
            WHERE
                b.proc_flag = 'Y'
        '''
        excludeDb = mySqlConn.query(strSql)
        excludeList = []
        for x in  excludeDb:
            excludeList.append(x["exclude_list"])
        return excludeList

    def Verifz_Exclude(self, singFullPathFileExt, excludList):
        ''' 排除文件校验函数 '''

        rtnResult = {}
        # 把入参文件替换为原始文件格式 D:\Path\File.xxx
        targetPathAndFile = singFullPathFileExt.replace("\\\\{0}\\".format(self.hostIp) ,"").replace("$",":")
        rtnResult["orig_path_file"] = targetPathAndFile
        self.taskDictInfo["nat_path_file"] = singFullPathFileExt

        for eExclude in excludList:

            # 分解排除列表中的元素
            ePath, eFileExt = os.path.split(eExclude)
            eFile, eExt = os.path.splitext(eFileExt)

            # 如果排除对象是一个完整路径，则需要判断所有切转对象里是否包含该对象，只要包含就不允许迁移
            if eExclude in targetPathAndFile:
                e1Ex = eExclude + "\\"  # 增加一层判断，避免出现全路劲为 2014-4-3 被 2014-4-30 错误的匹配
                if e1Ex in targetPathAndFile:
                    rtnResult["rule"] = eExclude
                    rtnResult["flag"] = False
                    return rtnResult

            # 如果是文件
            if os.path.isfile(singFullPathFileExt):
                ''' 判断文件只能用网络路径，用本地路径无法访问，会返回False '''
                tPath, tFileExt = os.path.split(targetPathAndFile)
                tFile, tExt = os.path.splitext(tFileExt)

                if targetPathAndFile == eExclude:
                    # 1 全路径 + 全文件名 + 扩展名 d:\HQ_Info_Files\Test_Files\20130201\TR12_2461\jz_jjcw.dbf
                    rtnResult["rule"] = eExclude
                    rtnResult["flag"] = False
                    return rtnResult

                if tFileExt == eExclude:
                    # 2 文件名 + 扩展名 AttachInfo.dat
                    rtnResult["rule"] = eExclude
                    rtnResult["flag"] = False
                    return rtnResult

                if eExclude.find(".*") != -1:
                    # 3 全路径 + 文件名 + 通配符 适配 d:\HQ_Info_Files\Test_Files\20130205\TR12_2461\SC_11170000_20130205_001N_A08_Z.*
                    tPathFile = tPath + "\\" + tFile
                    ePathFile = ePath + "\\" + eFile
                    if tPathFile == ePathFile:
                        rtnResult["rule"] = eExclude
                        rtnResult["flag"] = False
                        return rtnResult

                    if tFile == eFile:
                        # 4 文件名 + 通配符 适配 SC_11170000_20130201_001N_A03_Z.*
                        rtnResult["rule"] = eExclude
                        rtnResult["flag"] = False
                        return rtnResult

                if eExclude.find("*.*") != -1:
                    # 5 全路径 + 通配符 d:\HQ_Info_Files\Test_Files\新建文件夹\*.*
                    if tPath == ePath:
                        rtnResult["rule"] = eExclude
                        rtnResult["flag"] = False
                        return rtnResult

                if eExclude.find("*.") != -1:
                    # 6 通配符 + 扩展名 适配 *.dat
                    eExcludeArr = eExclude.split("*")
                    if eExcludeArr[1] == tExt:
                        rtnResult["rule"] = eExclude
                        rtnResult["flag"] = False
                        return rtnResult

                    if tPath == ePath and tExt == eExt:
                        # 6 全路径 + 通配符 + 扩展名 适配 d:\HQ_Info_Files\Test_Files\2342234\*.dat
                        rtnResult["rule"] = eExclude
                        rtnResult["flag"] = False
                        return rtnResult

                    if tExt == eExt and eExclude.find("\\") == -1:
                        # 7 文件名通配符 + 指定扩展名
                        rtnResult["rule"] = eExclude
                        rtnResult["flag"] = False
                        return rtnResult

        rtnResult["rule"] = "0"
        rtnResult["flag"] = True
        return rtnResult

    def Move_File_Proc(self,excludList):

        # 在NAS上创建主机IP命名的归档主目录
        newArchNasSubDir = r"{0}\{1}".format(self.archNasPath, self.hostIp)
        if os.path.exists(newArchNasSubDir) == False:
            os.makedirs(newArchNasSubDir)

        # 枚举所有要切转的文件列表
        for strRoot, lsDir, lsFiles in os.walk(self.GenLegaPath()):
            # 处理文件
            for strFile in lsFiles:
                singFullPathFileExt = os.path.join(strRoot, strFile)  # 合并文件路径

                # 判断文件修改日期 确认是否可以切转
                fileModTime = datetime.datetime.fromtimestamp(os.stat(singFullPathFileExt).st_mtime)  # 获取文件修改时间
                nowDate = datetime.datetime.now()      # 获取当前时间
                intDay = (nowDate - fileModTime).days  # 当前时间与文件修改时间的差异
                if intDay >= int(self.reservedDay):          # 修改时间大于参数设定的时间则可以切转
                    # strMd5Code = self.Get_File_MD5(singFullPathFileExt)

                    rtnResult = self.Verifz_Exclude(singFullPathFileExt, excludList)

                    if rtnResult["flag"] == True:
                        self.taskDictInfo["rule"] = rtnResult["rule"]
                        self.taskDictInfo["orig_path_file"] = rtnResult["orig_path_file"]
                        self.taskDictInfo["file_mod_time"] = fileModTime

                    else:
                        self.taskDictInfo["orig_path_file"] = rtnResult["orig_path_file"]
                        self.taskDictInfo["rule"] = rtnResult["rule"]
                        self.taskDictInfo["file_mod_time"] = fileModTime

                self.redisQ.put(self.taskDictInfo)
                remark_msg = "%s %s 文件信息获取成功，即将插入Redis队列中！！" % (
                    (self.taskDictInfo["host_ip"], self.taskDictInfo["orig_path_file"])
                )
                print(C_PrintLog.debug(), remark_msg)

def NetRemoteDisk2LocakDisk(archNasPath, archNasPathUser, archNasPathUserPasswd):
    ''' 重新映射网络路径 并返回网络路径盘符 '''

    rtnResult = {} # 定义一个返回结果的容器字典

    # 生成虚拟盘符列表，从虚拟盘符池中获取一个磁盘用于映射
    virLettel = []
    for i in range(110, 123):
        virLettel.append("%s:" % chr(i).upper())

    # data = os.popen('''wmic logicaldisk where "drivetype=4" get name,ProviderName,FreeSpace''').read()
    rtnWmicMsg = os.popen('''wmic logicaldisk get name,ProviderName,FreeSpace''').read()
    lines = rtnWmicMsg.split("\n")
    for line in lines:
        if ":" in line:
            lineArr = line.split(" ")
            while '' in lineArr:
                lineArr.remove('')

            localUseNetDiskLettel = lineArr[1]

            if len(lineArr)>2 :
                localUseNetDiskPath = lineArr[2]
            else:
                localUseNetDiskPath = ""

            # print(archNasPath, localUseNetDiskPath)
            if localUseNetDiskPath == archNasPath:
                ''' 如果已存在相关路径，则直接返回实际盘符 '''
                rtnResult["msg"] = localUseNetDiskLettel
                rtnResult["result"] = True
                return rtnResult
            else:
                if localUseNetDiskLettel in virLettel:
                    ''' 把已被占用的盘符从虚拟盘组中删除，防止重复映射 '''
                    virLettel.remove(localUseNetDiskLettel)
                isExist = True

    if isExist == True:
        isExistLettel = virLettel[-1]
        strCmd = r"net use %s %s %s /user:%s" % (isExistLettel, archNasPath, archNasPathUserPasswd, archNasPathUser)
        # print(strCmd)
        rtnCmdMsg = Popen(strCmd, shell=True, stdout=PIPE, stderr=PIPE)
        out, err = rtnCmdMsg.communicate()

        rtnErrMsg = "%sNoError" % err.decode("gb2312")

        # if rtnErrMsg != "NoError":
        #     for line in err.splitlines():
        #         if line.split():
        #             print (line.decode("gb2312"))

        if rtnErrMsg != "NoError":

            if "1219" in rtnErrMsg:
                ''' 
                不允许一个用户使用一个以上用户名与服务器或
                共享资源的多重连接。中断与此服务器或共
                享资源的所有连接，然后再试一次。
                '''
                ''' 取消用户名和密码进行一次直接连接 '''
                strCmd = r"net use %s %s" % (isExistLettel, archNasPath)
                rtnCmdMsg = Popen(strCmd, shell=True, stdout=PIPE, stderr=PIPE)
                out, err = rtnCmdMsg.communicate()
                if "命令成功完成" in out.decode("gb2312") :
                    rtnResult["msg"] = isExistLettel
                    rtnResult["no"] = "200000"
                    rtnResult["result"] = True
                    return rtnResult
                else:
                    rtnResult["msg"] = "多次重连失败"
                    rtnResult["no"] = "200001"
                    rtnResult["result"] = False
                    return rtnResult

            if "67" in rtnErrMsg:
                ''' 找不到网络名。 '''
                rtnResult["msg"] = "找不到网络名"
                rtnResult["no"] = "200004"
                rtnResult["result"] = False
                return rtnResult

            if "86" in rtnErrMsg:
                ''' 指定的网络密码不正确。 '''
                rtnResult["msg"] = "指定的网络密码不正确"
                rtnResult["no"] = "200002"
                rtnResult["result"] = False
                return rtnResult

    rtnResult["msg"] = "未知错误"
    rtnResult["no"] = "200003"
    rtnResult["result"] = False
    return True, isExistLettel

def Get_File_MD5(singFullPathFileExt):
    try:
        import hashlib
        myhash = hashlib.md5()
        f = open(singFullPathFileExt, "rb")
        while True:
            b = f.read(8096)
            if not b:
                break
            myhash.update(b)
        f.close()
        return myhash.hexdigest()
    except Exception as e:
        return False

def Get_File_Size(singFullPathFileExt):
    try:
        size = os.path.getsize(singFullPathFileExt)
        return size
    except Exception as e:
        return False

def Run_Threaded(argsDict):
    print(argsDict[0])
    func = argsDict[0][0]
    arg = argsDict[0][1]
    jobThread = threading.Thread(target=func,args=(arg,))
    jobThread.start()

if __name__ == "__main__" :

    # 清空所有网络共享链接
    # netSMBCMD = "net use * /delete /y"
    # Popen(netSMBCMD, stdout=PIPE, stderr=PIPE)
    # time.sleep(2)
    # # 重新映射归档路径
    # netSMBCMD = r"net use z: \\10.0.10.18\Comput_Files_Backup\901.服务器切转文件 "
    # Popen(netSMBCMD, stdout=PIPE, stderr=PIPE)

    ''' 获取 任务参数 '''
    sqlStr = "select * from backtaskmget_filebacktaskset where proc_flag = 'Y';"
    xList = mySqlConn.query(sqlStr)

    # RunMainPoint(xList)

    for x in xList:

        argsDict = ()
        argsDict = (RunMainPoint, x)

        scheduleTime = str(x["task_run_time"])
        scheduleTime = scheduleTime[:-3]
        if len(scheduleTime) == 4:
            scheduleTime = "0%s" % scheduleTime
        # schedule.every().day.at(scheduleTime).do(Run_Threaded,(RunMainPoint(x),))
        schedule.every().day.at("02:15").do(Run_Threaded,(argsDict,))

    while True:
        schedule.run_pending()
        time.sleep(1)

    # try:
    #     scheduleFlag = 1
    #     if scheduleFlag == 0:
    #         RunMainPoint(xList)
    #     else:
    #         # schedule.every(120).minutes.do(__PoolRunScheduler)
    #         schedule.every().day.at("00:20").do(RunMainPoint(xList))
    #         while True:
    #             schedule.run_pending()
    #             time.sleep(1)
    # except Exception as errInfo:
    #     if "No such file or directory" in str(errInfo):
    #         print (errinfo(),"Excel文件不在指定路径，请检查！")
    #     else :
    #         print(errinfo(),errInfo)


