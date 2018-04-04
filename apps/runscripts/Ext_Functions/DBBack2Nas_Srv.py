import os
import datetime
import json
import time
import schedule
import threading
from collections import namedtuple

os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
from apps.commset.GetSysInfo import mySqlConn

from apps.runscripts.Ext_Functions.CommFuncs import C_PrintLog, Print_Dict_KandV, \
    Net_RemtePath_IsAccess, DateEncoder, RedisQueue

''' 数据传到结构体 字典类型 '''

DB_BACK_PARAM = {

}

def Run_Main_Point(*args,**kwargs):
    pass

def Dict_2_class(dict):
    fieldList = []
    kvListStr = ""
    for key, value in dict.items():
        fieldList.append(key)
        # print(str(type(value)))
        if str(type(value)) == "<class 'str'>" and "\\" in value:
            value = value.replace("\\","\\\\")
            print(type(value),value)

        if kvListStr == "":
            kvListStr = kvListStr + '%s = "%s"' % (key, value)
        else:
            kvListStr = kvListStr + ',%s = "%s"' % (key,value)
    print(kvListStr)
    print(fieldList)
    custTuple = namedtuple('custTuple', fieldList)

    custDict = custTuple(db_user = "system",compre_type = "RAR",is_compre = "Y",os_type = "4",reserved_day = "10",host_ip = "192.168.168.56",names_of_backdb = "kbssuser",proc_flag = "Y",arch_nas_path = "\\10.0.10.18\Comput_Files_Backup\999.TestFile",db_user_passwd = "oracle",enforce_flag = "N",id = "1",arch_nas_passwd = "2634400",arch_nas_user = "admin",os_user_passwd = "2634400",os_user = "root",is_compre_passwd = "Y",file_save_path = "/data/oradata/db_backup",db_type = "ORACLE",db_sid = "kbssdb",task_name = "统一账户UAT56数据库备份",task_run_time = "23:30:00")


    print(custDict.arch_nas_path)
    # custDict = custTuple(kvListStr)

    return custDict


if __name__ == "__main__" :

    ''' 获取 任务运行参数 '''
    sqlStr = "select * from backtaskmget_dbbacktaskset where proc_flag = 'Y';"
    xList = mySqlConn.query(sqlStr)

    # 获取 redis 连接参数
    # redisR = Get_Redis_Param("REDIS_192.168.169.30_FileCut", mySqlConn, "R") # Req
    # redisA = Get_Redis_Param("REDIS_192.168.169.30_FileCut", mySqlConn, "A") # Ans


    for x in xList:

        Print_Dict_KandV(x,"Init")

        # runParam = defaultdict(x)
        #
        # print(runParam)




        # Run_Main_Point(x, mySqlConn)

        # schedule的do函数只能接受一个入参，特使用元祖包裹必要的参数
    #     argsDict = ()
    #     argsDict = (RunMainPoint, x, mySqlConn)
    #
    #     # 格式化后台任务日期 HH:MM
    #     scheduleTime = str(x["task_run_time"])
    #     scheduleTime = scheduleTime[:-3]
    #     if len(scheduleTime) == 4:
    #         scheduleTime = "0%s" % scheduleTime
    #     # schedule.every().day.at(scheduleTime).do(Run_Threaded,(argsDict,))
    #     schedule.every().day.at("17:01").do(Run_Threaded,(argsDict,))
    #
    # while True:
    #     schedule.run_pending()
    #     # print(C_PrintLog.debug(),"等待任务执行。。。")
    #     time.sleep(1)








