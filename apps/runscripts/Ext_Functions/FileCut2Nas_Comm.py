import os
from subprocess import PIPE, Popen
import time
from datetime import datetime
import shutil

def Net_RemoteDisk_2_LocakDisk(archNasPath, archNasPathUser, archNasPathUserPasswd):
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
from apps.runscripts.Ext_Functions.CommFuncs import C_PrintLog


def Get_File_MD5(fileAllPath):
    ''' 获取文件MD5码 '''
    try:
        import hashlib
        myhash = hashlib.md5()
        f = open(fileAllPath, "rb")
        while True:
            b = f.read(8096)
            if not b:
                break
            myhash.update(b)
        f.close()
        return myhash.hexdigest()
    except Exception as e:
        return False

def Get_File_Size(fileAllPath):
    ''' 获取文件大小 kb '''
    try:
        fileSize = os.path.getsize(fileAllPath)
        return fileSize
    except Exception as e:
        return False

def Count_File_Num(rootPath):
    ''' 获取文件夹下文件的总数量 '''
    try:
        fileCnt = 0
        for root, dirs, files in os.walk(rootPath):  # 遍历统计
            for each in files:
                fileCnt += 1  # 统计文件夹下文件个数
        return fileCnt
    except Exception as e:
        return False


class CopyHostFileClass(object):

    def __init__(self, taskDictInfo, mySqlConn, RedisR):
        self.taskDictInfo = taskDictInfo
        self.taskDictInfo["new_arch_nas_dir"] = r"{0}\{1}".format(self.taskDictInfo["arch_nas_path"], self.taskDictInfo["host_ip"])
        self.RedisR = RedisR
        self.mySqlConn = mySqlConn

    def Get_ExcludeList(self):
        strSql = '''
            SELECT
                b.exclude_list
            FROM
                backtaskmget_filebacktaskset a
            INNER JOIN backtaskmget_filebacktaskexcludeset b ON a.id = b.task_name_id
            WHERE
                b.proc_flag = 'Y'
                AND a.id = '%s'
        ''' % self.taskDictInfo["id"]
        excludeDb = self.mySqlConn.query(strSql)
        excludeList = []
        for x in  excludeDb:
            excludeList.append(x["exclude_list"])
        return excludeList

    def Verifz_Exclude(self, singFullPathFileExt, excludList):
        ''' 排除文件校验函数 '''

        for eExclude in excludList:

            # 分解排除列表中的元素
            ePath, eFileExt = os.path.split(eExclude)
            eFile, eExt = os.path.splitext(eFileExt)

            # 如果排除对象是一个完整路径，则需要判断所有切转对象里是否包含该对象，只要包含就不允许迁移
            if eExclude in singFullPathFileExt:
                e1Ex = eExclude + "\\"  # 增加一层判断，避免出现全路劲为 2014-4-3 被 2014-4-30 错误的匹配
                if e1Ex in singFullPathFileExt:
                    self.taskDictInfo["rule"] = eExclude
                    return False

            # 如果是文件
            if os.path.isfile(self.taskDictInfo['unc_file_name']):
                ''' 判断文件只能用网络路径，用本地路径无法访问，会返回False '''
                tPath, tFileExt = os.path.split(singFullPathFileExt)
                tFile, tExt = os.path.splitext(tFileExt)

                if singFullPathFileExt == eExclude:
                    # 1 全路径 + 全文件名 + 扩展名 d:\HQ_Info_Files\Test_Files\20130201\TR12_2461\jz_jjcw.dbf
                    self.taskDictInfo["rule"] = eExclude
                    return False

                if tFileExt == eExclude:
                    # 2 文件名 + 扩展名 AttachInfo.dat
                    self.taskDictInfo["rule"] = eExclude
                    return False

                if eExclude.find(".*") != -1:
                    # 3 全路径 + 文件名 + 通配符 适配 d:\HQ_Info_Files\Test_Files\20130205\TR12_2461\SC_11170000_20130205_001N_A08_Z.*
                    tPathFile = tPath + "\\" + tFile
                    ePathFile = ePath + "\\" + eFile
                    if tPathFile == ePathFile:
                        self.taskDictInfo["rule"] = eExclude
                        return False

                    if tFile == eFile:
                        # 4 文件名 + 通配符 适配 SC_11170000_20130201_001N_A03_Z.*
                        self.taskDictInfo["rule"] = eExclude
                        return False

                if eExclude.find("*.*") != -1:
                    # 5 全路径 + 通配符 d:\HQ_Info_Files\Test_Files\新建文件夹\*.*
                    if tPath == ePath:
                        self.taskDictInfo["rule"] = eExclude
                        return False

                if eExclude.find("*.") != -1:
                    # 6 通配符 + 扩展名 适配 *.dat
                    eExcludeArr = eExclude.split("*")
                    if eExcludeArr[1] == tExt:
                        self.taskDictInfo["rule"] = eExclude
                        return False

                    if tPath == ePath and tExt == eExt:
                        # 6 全路径 + 通配符 + 扩展名 适配 d:\HQ_Info_Files\Test_Files\2342234\*.dat
                        self.taskDictInfo["rule"] = eExclude
                        return False

                    if tExt == eExt and eExclude.find("\\") == -1:
                        # 7 文件名通配符 + 指定扩展名
                        self.taskDictInfo["rule"] = eExclude
                        return False

        self.taskDictInfo["rule"] = "0"
        return True

    def Move_File_Proc(self,excludList):

        moveCnt = 0

        # 在NAS上创建主机IP命名的归档主目录
        if os.path.exists(self.taskDictInfo["new_arch_nas_dir"]) == False:
            os.makedirs(self.taskDictInfo["new_arch_nas_dir"])

        # 枚举所有要切转的文件列表
        for strRoot, lsDir, lsFiles in os.walk(self.taskDictInfo["unc_access_base_path"]):
            # 处理文件
            for strFile in lsFiles:
                singFullPathFileExt = os.path.join(strRoot, strFile)  # 合并文件路径
                self.taskDictInfo["unc_file_name"] = singFullPathFileExt
                # 判断文件修改日期 确认是否可以切转
                self.taskDictInfo["file_mod_time"] = datetime.fromtimestamp(os.stat(singFullPathFileExt).st_mtime)  # 获取文件修改时间
                nowDate = datetime.now()      # 获取当前时间
                intDay = (nowDate - self.taskDictInfo["file_mod_time"]).days  # 当前时间与文件修改时间的差异
                if intDay >= int(self.taskDictInfo['reserved_day']):          # 修改时间大于参数设定的时间则可以切转
                    # strMd5Code = self.Get_File_MD5(singFullPathFileExt)

                    # 转义unc文件路径为本地原始路径，便于与排除列表匹配
                    targetPathAndFile = singFullPathFileExt.replace("\\\\{0}\\".format(self.taskDictInfo['host_ip']), "").replace("$",":")
                    self.taskDictInfo["local_file_name"] = targetPathAndFile

                    self.Verifz_Exclude(self.taskDictInfo["local_file_name"], excludList)

                    # 符合要求的文件转入队列，时间不满足的文件忽略
                    self.RedisR.put(self.taskDictInfo)

                    remark_msg = "%s %s 文件信息获取成功，即将插入Redis队列中！！" % (
                        (self.taskDictInfo["host_ip"], self.taskDictInfo["local_file_name"])
                    )
                    print(C_PrintLog.debug(), remark_msg)
                    moveCnt += 1

                else:
                    ''' 不满足创建时间要求，不处理 '''
                    pass

        return moveCnt

    def Delete_Empty(self, singDir, excludList):
        empPathFlag = []
        # 将待删除的目录写入数组中
        for root, dirs, files in os.walk(singDir):
            if files.__len__() == 0 and root != singDir:  # 文件为空，并且排除根目录
                if self.Verifz_Exclude(root, excludList) == True:
                    empPathFlag.append(root)
        # 重组目录数组排列顺序 确保删除目录操作是从最里层进行
        empPathFlag.sort(key=len)
        empPathFlag.reverse()
        # print(empPathFlag)
        # 开始执行删除
        for _ in empPathFlag:
            if os.path.exists(_):
                try:
                    os.rmdir(_)
                    if os.path.isdir(_) == False:
                        ''' 如果目录返回失败 则已不存在 故认为删除成功 '''
                        print(C_PrintLog.debug(), "%s 删除目录成功!" % _)
                    else:
                        print(C_PrintLog.errinfo(), "%s 删除目录失败!" % _)
                except:
                    pass

    def CountFileNum(self):
        fileCnt = 0
        for root, dirs, files in os.walk(self.taskDictInfo["netRootPath"]):  # 遍历统计
            for each in files:
                fileCnt += 1  # 统计文件夹下文件个数
        return fileCnt

    def MoveFile2NAS(self, singFile, newPath):
        while True:
            try:
                shutil.move(singFile, newPath)
                return True
            except Exception as e:
                strErrInfo = str(e)
                if "Destination path" in strErrInfo and "already exists" in strErrInfo:
                    errFileName = os.path.basename(singFile)
                    delFileName = newPath + "\\" + errFileName  # 重组已存在的文件路径，准备删除后重新拷贝
                    os.remove(delFileName)
                    print(C_PrintLog.tmpinfo(), errFileName, "目的端已存在同名文件，%s 将其删除!" % delFileName)
                elif "Permission denied" in strErrInfo:
                    return strErrInfo
                    # cmdRtn = Popen("del /f/s/q %s" % singFile, stdout=PIPE, stderr=PIPE)
                    # print(cmdRtn.read())
                else:
                    return strErrInfo

    def Create_New_Sub_dir(self, newPath):
        '''  如果NAS上没有要切转的目录，则创建 '''
        try:
            if os.path.exists(newPath) == False:
                os.makedirs(newPath)
        except Exception as e:
            pass

    def Copy_File2Nas_Main(self):

        self.taskDictInfo["file_md5_code"] = ""
        self.taskDictInfo["file_size"] = "0"
        self.taskDictInfo["nas_new_file_path"] = ""

        self.taskDictInfo["c_local_file_dir"], self.taskDictInfo["c_local_file_name"] = os.path.split(
            self.taskDictInfo["local_file_name"])

        try:
            self.taskDictInfo["file_md5_code"] = Get_File_MD5(self.taskDictInfo["unc_file_name"])
            if self.taskDictInfo["file_md5_code"] == False:
                self.taskDictInfo["file_md5_code"] = ""
                self.taskDictInfo["run_status"] = "3"
                self.taskDictInfo["run_msg"] = "200111：%s %s MD5码获取失败，请检查！" % (self.taskDictInfo["host_ip"], self.taskDictInfo["local_file_name"])
                raise Exception(self.taskDictInfo["run_msg"])

            self.taskDictInfo["file_size"] = Get_File_Size(self.taskDictInfo["unc_file_name"])
            # if self.taskDictInfo["file_size"] == False:
            #     self.taskDictInfo["file_size"] = 0
            #     self.taskDictInfo["run_status"] = "3"
            #     self.taskDictInfo["run_msg"] = "200112：%s %s 文件大小获取失败，请检查！" % (self.taskDictInfo["host_ip"], self.taskDictInfo["local_file_name"])
            #     raise Exception(self.taskDictInfo["run_msg"])

            if self.taskDictInfo["rule"] == "0":
                ''' 无排除名单匹配 '''
                # 组装新的归档目录文件路径
                nasNewFilePath = r"%s\%s" % (self.taskDictInfo["new_arch_nas_dir"], self.taskDictInfo['local_file_name'].replace(":","$"))
                self.taskDictInfo["nas_new_file_path"] = nasNewFilePath

                # 多任务机制下可能会出现子进程抢着创建目录的情况，特使用单独函数创建子目录，防止程序异常跳出
                newNasPath = os.path.dirname(nasNewFilePath)
                self.Create_New_Sub_dir(newNasPath)

                if os.path.isfile(self.taskDictInfo["unc_file_name"]) == True:
                    remarkMsg = "%s %s %s 文件满足归档要求，正在执行迁移命令！！" % (self.taskDictInfo["file_md5_code"], self.taskDictInfo["host_ip"], self.taskDictInfo["local_file_name"])
                    self.taskDictInfo["run_msg"] = remarkMsg
                    print(C_PrintLog.debug(), remarkMsg)
                    copyRtnMsg = self.MoveFile2NAS(self.taskDictInfo["unc_file_name"], nasNewFilePath)
                    if copyRtnMsg == True:
                        self.taskDictInfo["restore_cmd"] = "echo f|xcopy /s/f %s %s" % (nasNewFilePath, self.taskDictInfo["unc_file_name"])
                        self.taskDictInfo["run_status"] = "1"
                    else:
                        self.taskDictInfo["run_msg"] = copyRtnMsg
                        self.taskDictInfo["run_status"] = "3"
                        raise Exception(self.taskDictInfo["run_msg"])

            else:
                self.taskDictInfo["nas_new_file_path"] = ""
                self.taskDictInfo["run_msg"] = "%s %s %s 文件匹配策略[%s]成功，跳过归档任务！！" % (
                    self.taskDictInfo["file_md5_code"], self.taskDictInfo["host_ip"], self.taskDictInfo["local_file_name"], self.taskDictInfo["rule"])
                self.taskDictInfo["run_status"] = "2"

        except Exception as e:

            print(C_PrintLog.errinfo(),self.taskDictInfo["run_msg"])



