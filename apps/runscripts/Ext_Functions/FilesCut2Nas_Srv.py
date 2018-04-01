import os
import datetime
import json
import time
import schedule
import threading

os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
from apps.commset.GetSysInfo import mySqlConn

from apps.runscripts.Ext_Functions.CommFuncs import C_PrintLog, Print_Dict_KandV, \
    Net_RemtePath_IsAccess, DateEncoder, RedisQueue

from apps.runscripts.Ext_Functions.FileCut2Nas_Comm import Count_File_Num, CopyHostFileClass


def RunMainPoint(x, mySqlConn):

    RedisR = RedisQueue("req", x['id'], "192.168.169.30", 6379, 1)

    # 执行前先清空队列
    RedisR.delete_db()

    # time.sleep(20)

    # 组装新的SAMBA网络共享目录 目的IP 目的本地路径 拷贝服务通过网络映射方式进行
    x["unc_access_base_path"] = "\\\\%s\\%s" % (x["host_ip"],x["file_save_path"].replace(":\\","$\\"))
    # 目录文件汇总，防止文件总数为0的情况下造成程序异常
    x["file_cnt"] = "0"

    # 定义一个进程运行状态字典子项 用于进程状态的记录
    x["run_status"] = "3"

    Print_Dict_KandV(x,"Init")
    time.sleep(1)

    # 引入本程序核心类
    chfc = CopyHostFileClass(x, mySqlConn, RedisR)

    # 测试各路径是否能正常访问
    try:
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

        # 如果根目录文件为空，则直接报错
        rtnCnt = Count_File_Num(x['unc_access_base_path'])
        if rtnCnt == 0:
            x["run_status"] = "3"
            x["run_msg"] = "1003：指定转换目标服务器根目录文件为0，跳过本次任务！"
            raise Exception(rtnResult)

        # 开始处理业务逻辑
        excludList = chfc.Get_ExcludeList()
        moveCnt = chfc.Move_File_Proc(excludList)

        # 删除空目录
        while True:
            # 判断队列中是否还有记录 如果为空则认为处理完毕，开始删除空目录
            moveRemCnt = RedisR.qsize()
            # print(moveRemCnt)
            if moveRemCnt == 0:
                break

        # 删除空目录
        chfc.Delete_Empty(x["unc_access_base_path"], excludList)

    except Exception as e:

        ''' 写一条错误日志 '''
        strSql = '''
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
        ''' % (
            x["task_name"],
            "3",
            datetime.datetime.now().strftime('%Y-%m-%d'),
            datetime.datetime.now().strftime('%H:%M:%S'),
            x["host_ip"],
            datetime.datetime.now().strftime('1900-01-01 00:00:00.000000'),
            "",
            "",
            "",
            x["arch_nas_path"],
            0,
            json.dumps(x, cls=DateEncoder,ensure_ascii=False),
        )
        mySqlConn.execute(strSql)
        print(C_PrintLog.errinfo(),x["task_name"],x["run_status"],e)

def Run_Threaded(argsDict):
    print(C_PrintLog.debug(),argsDict[0][1]['host_ip'],argsDict[0][1]['file_save_path'], "启动！")
    func = argsDict[0][0]
    arg = argsDict[0][1]
    mySqlConn = argsDict[0][2]
    jobThread = threading.Thread(target=func,args=(arg,mySqlConn,))
    jobThread.start()

if __name__ == "__main__" :

    ''' 获取 任务运行参数 '''
    sqlStr = "select * from backtaskmget_filebacktaskset where proc_flag = 'Y';"
    xList = mySqlConn.query(sqlStr)

    # 获取 redis 连接参数
    # redisR = Get_Redis_Param("REDIS_192.168.169.30_FileCut", mySqlConn, "R") # Req
    # redisA = Get_Redis_Param("REDIS_192.168.169.30_FileCut", mySqlConn, "A") # Ans

    for x in xList:

        # RunMainPoint(x, mySqlConn)

        # schedule的do函数只能接受一个入参，特使用元祖包裹必要的参数
        argsDict = ()
        argsDict = (RunMainPoint, x, mySqlConn)

        # 格式化后台任务日期 HH:MM
        scheduleTime = str(x["task_run_time"])
        scheduleTime = scheduleTime[:-3]
        if len(scheduleTime) == 4:
            scheduleTime = "0%s" % scheduleTime
        # schedule.every().day.at(scheduleTime).do(Run_Threaded,(argsDict,))
        schedule.every().day.at("17:01").do(Run_Threaded,(argsDict,))

    while True:
        schedule.run_pending()
        # print(C_PrintLog.debug(),"等待任务执行。。。")
        time.sleep(1)
