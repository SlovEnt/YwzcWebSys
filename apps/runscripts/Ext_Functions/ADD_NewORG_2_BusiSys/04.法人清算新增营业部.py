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

from apps.runscripts.Ext_Functions.ADD_NewORG_2_BusiSys.Current_Process import ESIM_Add_Org, Back_Tables, \
    Table_Row_Is_Exist, Rtn_Table_Desc, Assembling_Insert_Sql, Assembling_Update_Sql, Get_SEQUENCES_NEXTVAL


# 引入全局参数文件
currPath = os.path.dirname(os.path.realpath(__file__))
globParaList = Get_Param_Info("%s/Config.ini" % (currPath))

# 创建到新意数据库的链接
XY_TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SERVICE_NAME=%s)))' % (
    globParaList["XY_ORACLE_HOST"],
    globParaList["XY_ORACLE_PORT"],
    globParaList["XY_ORACLE_SERVICE_NAME"]
)
oraConn = cxOracle(
    globParaList["XY_ORACLE_USER_NAME"],
    globParaList["XY_ORACLE_USER_PASSWD"],
    XY_TNS_NAME
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

            bSysName = "法人清算_{0}".format(init["org_code"])

            # 动态生成任务名称
            taskName = "{0}_{1}".format(bSysName, globParaList["XY_ORACLE_HOST"])
            init["task_name"] = taskName

            # 保留的日志文件
            nowDate = datetime.datetime.now()
            strDate = nowDate.strftime("%Y%m%d%H%M%S")
            logFilePath = r"%s\%s\ESIM_%s_%s_ADD_LOG.log" % (
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

            backTableList = [
                "ES_SYSTEM.DEPARTMENT",
                "ES_SYSTEM.DEP_ROLE_RELA",
                "ES_SYSTEM.USER_ROLE",
                "ES_SYSTEM.USER_ROLE_RIGHT",
                "EA_PUB.RI_USER_ROLE_RIGHT",
                "EA_PUB.SYS_SETTLE_DEPT",
                "EA_PUB.SYS_CUST_DEPT",
                "EA_PUB.BR_CONTRACT",
                "EA_DEPACCT.DEPT_ACC",
                "EA_PUB.RI_DEP_RIGHT",
                "EA_DEPACCT.ASSIST_ACCT_CODE",
                "EA_DEPACCT.FUND_BALANCE",
                "EA_DATAREP.SYS_CSRC_CODE",
                "UI_FI.K3_ACCT_COMP",
                "UI_FI.K3_ACCT_COMP_AUX",
                "UI_FI.JD_KDK3_ACCT_CFG"
            ]

            for tableName in backTableList :
                Back_Tables(log, oraConn, tableName, init["org_code"])



            if len(init["org_code"] ) == 2:
                init["xy_org"] = "GYZQ0000%s" % init["org_code"]
            else:
                init["xy_org"] = "GYZQ000%s" % init["org_code"]

            Print_Dict_KandV(init,"self.info")

            esimAo = ESIM_Add_Org(init, oraConn, mySqlConn, log)

            tableName = "ES_SYSTEM.DEPARTMENT"
            MSG_INFO = esimAo.Insert_ES_SYSTEM_DEPARTMENT(tableName)
            if MSG_INFO["MSG_NO"] == 400000 :
                init["dep_id"] = MSG_INFO["MSG_CONTENT"]

            tableName = "ES_SYSTEM.DEP_ROLE_RELA"
            esimAo.Insert_ES_SYSTEM_DEP_ROLE_RELA(tableName, "22")
            esimAo.Insert_ES_SYSTEM_DEP_ROLE_RELA(tableName, "42")


            roleNames = ["财务主管", "财务录入", "存管复核", "存管录入", "营业部用户影像录入角色"]
            for roleName in roleNames :
                tableName = "ES_SYSTEM.USER_ROLE"
                MSG_INFO = esimAo.Insert_ES_SYSTEM_USER_ROLE(tableName, roleName)
                if MSG_INFO["MSG_NO"] == 410000:
                    init["role_id"] = MSG_INFO["MSG_CONTENT"]
                tableName = "ES_SYSTEM.USER_ROLE_RIGHT"
                esimAo.Insert_ES_SYSTEM_USER_ROLE_RIGHT(tableName, roleName, init["role_id"])

            tableName = "EA_PUB.SYS_SETTLE_DEPT"
            esimAo.Insert_EA_PUB_SYS_SETTLE_DEPT(tableName)

            tableName = "EA_PUB.SYS_CUST_DEPT"
            esimAo.Insert_EA_PUB_SYS_CUST_DEPT(tableName)

            tableName = "EA_DATAREP.SYS_CSRC_CODE"
            esimAo.Insert_EA_DATAREP_SYS_CSRC_CODE(tableName)

            tableName = "EA_PUB.BR_CONTRACT"
            mktCodes = ["01","02","03","04","13"]
            for mktCode in mktCodes :
                esimAo.Insert_EA_PUB_BR_CONTRACT(tableName, mktCode)

            tableName = "EA_PUB.RI_DEP_RIGHT"
            esimAo.Insert_EA_PUB_RI_DEP_RIGHT(tableName)

            tableName = "EA_PUB.RI_USER_ROLE_RIGHT"
            esimAo.Insert_EA_PUB_RI_USER_ROLE_RIGHT(tableName)

            tableName = "EA_DEPACCT.DEPT_ACC"
            # Rtn_Table_Desc(oraConn, tableName)
            esimAo.Insert_EA_DEPACCT_DEPT_ACC(tableName)

            tableName = "UI_FI.K3_ACCT_COMP"
            esimAo.Insert_UI_FI_K3_ACCT_COMP(tableName)

            tableName = "UI_FI.K3_ACCT_COMP_AUX"
            esimAo.Insert_UI_FI_K3_ACCT_COMP_AUX(tableName)

            tableName = "UI_FI.JD_KDK3_ACCT_CFG"
            # Rtn_Table_Desc(oraConn, tableName)
            esimAo.Insert_UI_FI_JD_KDK3_ACCT_CFG(tableName)

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
