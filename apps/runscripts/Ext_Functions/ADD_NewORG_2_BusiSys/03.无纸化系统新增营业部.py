import os
import datetime
import json
import time
import schedule
import threading
from collections import namedtuple
import traceback

os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
from apps.commset.GetSysInfo import mySqlConn

from apps.runscripts.Ext_Functions.CommFuncs import C_PrintLog, Get_Param_Info, \
    cxOracle, Print_Dict_KandV, Gen_Now_Date, Dict2List

from apps.runscripts.Ext_Functions.ADD_NewORG_2_BusiSys.Current_Process import WZH_Add_Org, Back_Tables, \
    Table_Row_Is_Exist, Rtn_Table_Desc, Assembling_Insert_Sql, Assembling_Update_Sql


# 引入全局参数文件
currPath = os.path.dirname(os.path.realpath(__file__))
globParaList = Get_Param_Info("%s/Config.ini" % (currPath))

# 创建Oracle库的链接
XYIMG_TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SERVICE_NAME=%s)))' % (
    globParaList["XYIMG_ORACLE_HOST"],
    globParaList["XYIMG_ORACLE_PORT"],
    globParaList["XYIMG_ORACLE_SERVICE_NAME"],
)
oraConn = cxOracle(
    globParaList["XYIMG_ORACLE_USER_NAME"],
    globParaList["XYIMG_ORACLE_USER_PASSWD"],
    XYIMG_TNS_NAME
)

if __name__ == "__main__" :
    """ 为新意无纸化系统新增营业部运营参数脚本 """

    try:

        MSG_INFO = {}
        MSG_INFO["MSG_NO"] = 0
        MSG_INFO["MSG_STR"] = "初始消息空间"

        ''' 获取 任务运行参数 '''
        sqlStr = "select * from insbusi_inserneworginfo where insert_org_flag = '0';"
        xList = mySqlConn.query(sqlStr)

        if len(xList) == 0:
            MSG_INFO["MSG_NO"] = 100001
            MSG_INFO["MSG_STR"] = "没有要增加的记录，请检查参数表中的处理标志！"
            raise Exception (MSG_INFO)

        for init in xList:

            bSysName = "无纸化_{0}".format(init["org_code"])

            # 动态生成任务名称
            taskName = "{0}_{1}".format(bSysName, globParaList["XYIMG_ORACLE_HOST"])
            init["task_name"] = taskName

            # 保留的日志文件
            nowDate = datetime.datetime.now()
            strDate = nowDate.strftime("%Y%m%d%H%M%S")
            logFilePath = r"%s\%s\WZH_%s_%s_ADD_LOG.log" % (
                currPath,
                globParaList["LOG_FILE_PATH"],
                init["org_code"],
                strDate)
            logFile = open((logFilePath), "w+", encoding='utf8')
            # 引入日志类
            log = C_PrintLog(logFile)

            init["oper_date"] = Gen_Now_Date("yyyymmdd")[1]

            newParaList = sorted(Dict2List(init), key=lambda x: x[0], reverse=False)
            for key, value in newParaList:
                log.PrintDebugLog("%s: %s" % (key, value))
            log.PrintDebugLog("------------------------------------")

            # 临时备份所有表
            backTableList = [
                "EI_EAMS.CBPS_PTL_VER_ITEM",
                "EI_EAMS.CBPS_CODE_NOTE",
                "CI_CUSTDB.DEP_RIGHT",
                "CI_CUSTDB.DEPARTMENT"
            ]

            for tableName in backTableList :
                Back_Tables(log, oraConn, tableName, init["org_code"])


            wzhAo = WZH_Add_Org(init, oraConn, mySqlConn, log)

            tableName = "EI_EAMS.CBPS_PTL_VER_ITEM"
            wzhAo.Insert_EI_EAMS_CBPS_PTL_VER_ITEM(tableName)

            tableName = "EI_EAMS.CBPS_CODE_NOTE"
            # Rtn_Table_Desc(oraConn, tableName)
            wzhAo.Insert_EI_EAMS_CBPS_CODE_NOTE(tableName)

            tableName = "CI_CUSTDB.DEP_RIGHT"
            wzhAo.Insert_CI_CUSTDB_DEP_RIGHT(tableName)

            tableName = "CI_CUSTDB.DEPARTMENT"
            # Rtn_Table_Desc(oraConn, tableName)
            wzhAo.Insert_CI_CUSTDB_DEPARTMENT(tableName)

        # 设置任务状态
        task_run_status = 1

    except Exception as e:

        # 设置任务状态
        task_run_status = 3

        time.sleep(0.5)
        traceback.print_exc()
        time.sleep(0.5)

        if 'MSG_INFO' in dir():
            log.PrintErrorLog("{0}:{1}:{2}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"],e))
        else:
            log.PrintErrorLog(e)

    finally:

        if 'logFile' in dir():
            logFile.close()

            # 把日志写入数据库中
            with open(logFilePath, encoding='UTF-8') as f:
                logContext = f.read()

            logContext = logContext.replace("'","''")

            strSql = "INSERT INTO `YwzcWebSys`.`insbusi_inserneworginfolog` (`oper_sys`, `insert_datetime`, `log_txt`, `org_code_id`, `task_status`) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}')".format(
                init["task_name"],
                datetime.datetime.now(),
                logContext,
                init["id"],
                task_run_status,
            )
            mySqlConn.execute(strSql)



