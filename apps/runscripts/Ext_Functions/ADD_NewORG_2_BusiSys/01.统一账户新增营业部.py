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

from apps.runscripts.Ext_Functions.ADD_NewORG_2_BusiSys.Current_Process import Tyzh_Add_Org


# 引入全局参数文件
currPath = os.path.dirname(os.path.realpath(__file__))
globParaList = Get_Param_Info("%s/Config.ini" % (currPath))


# 创建到账户库的链接
TY_TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SERVICE_NAME=%s)))' % (
globParaList["TY_ORACLE_HOST"], globParaList["TY_ORACLE_PORT"], globParaList["TY_ORACLE_SERVICE_NAME"])
oraConn = cxOracle(globParaList["TY_ORACLE_USER_NAME"], globParaList["TY_ORACLE_USER_PASSWD"], TY_TNS_NAME)

# 创建到数据中心的链接
DC_TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SID=%s)))' % (
globParaList["DC_ORACLE_HOST"], globParaList["DC_ORACLE_PORT"], globParaList["DC_ORACLE_SERVICE_NAME"])
oraConnDc = cxOracle(globParaList["DC_ORACLE_USER_NAME"], globParaList["DC_ORACLE_USER_PASSWD"],
                     DC_TNS_NAME)  # 通过参数文件获取需要增加的一些信息

if __name__ == "__main__" :
    """ 为统一账户新增营业部运营参数脚本 """

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

            bSysName = "统一账户_{0}".format(init["org_code"])

            # 动态生成任务名称
            taskName = "{0}_{1}".format(bSysName, globParaList["TY_ORACLE_HOST"])
            init["task_name"] = taskName

            # 保留的日志文件
            nowDate = datetime.datetime.now()
            strDate = nowDate.strftime("%Y%m%d%H%M%S")
            logFilePath = r"%s\%s\TY_%s_%s_ADD_LOG.log" % (
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

            # Print_Dict_KandV(init, "self.info")

            # 创建任务核心类
            tyzhAo = Tyzh_Add_Org(init, oraConn, mySqlConn, log)


            # 备份所有数据表
            tableNameList = ("ORG",
                            "USER_RTOBJ",
                            "SYS_DD_ITEM",
                            "OPENTMPL_CFG",
                            "OPENTMPL_SUBCFG",
                            "SERIAL",
                            "STK_ACCTBIZ_ORG",
                            "STK_ACCTBIZ_AGENT_NEW",
                            "STK_ACCTBIZ_CFG_NEW",
                            "STK_ACCTBIZ_ORG_NEW",
                            "XY_ORG",
                            "IMG_STORE_CFG",
                            "STK_PBU_ORG",
                            "GENERATE_RULE",
                             )
            for tableName in tableNameList:
                tyzhAo.Back_Tables(tableName)

            # (1)系统参数—机构管理—机构设置;
            '''
                --ORG_TYPE:'0' -- 内部机构；'1' -- 银行机构；'2' -- 登记公司；'3' -- 基金公司；'4' -- 期货公司
                --ORG_CLS:'0' -- 总部；'1' -- 管理；'2' -- 业务
                --ORG_STATUS:'0' -- 正常；'9' -- 注销
                --ACCT_LEN:账户长度
                --ACCT_PREFIX:账户前缀
            '''
            tableName = "KBSSUSER.ORG"
            tyzhAo.Insert_ORG(tableName)

            # (2)为总部柜员添加新增营业部的访问权限
            tableName = "KBSSUSER.USER_RTOBJ"
            tyzhAo.Insert_USER_RTOBJ(tableName)

            # (3)系统参数数据字典管理—机构数据字典;
            tableName = "KBSSUSER.SYS_DD_ITEM"

            # 部分系统字典可以通过数据中心导入，所以引入数据中心的Oracle连接
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "COM_MODEL", oraConnDc)  # 佣金模板 COM_MODEL
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "CUACCT_CLS", oraConnDc)  # 资产账户类别 CUACCT_CLS
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "CUACCT_CLS_FEE_SN", oraConnDc)  # 分类费用编码 CUACCT_CLS_FEE_SN
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "CUACCT_GRP", oraConnDc)  # 资产账户组别 CUACCT_GRP
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "CUACCT_LVL", oraConnDc)  # 资产账户级别 CUACCT_LVL
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "FILINGCABINET_NO", oraConnDc)  # 档案柜编号 FILINGCABINET_NO
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "SZACCT_DCL_ID", oraConnDc)  # 深登使用信息申报营业部编码 SZACCT_DCL_ID
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "FISL_CUACCT_CLS", oraConnDc)   # 信用资产账户类别
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "FISL_CUACCT_GRP", oraConnDc)   # 信用资产账户组别
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "FISL_CUACCT_LVL", oraConnDc)   # 信用资产账户级别
            # tyzhAo.Insert_SYS_DD_ITEM(tableName, "OPT_CUACCT_CLS", oraConnDc)   # 期权资产账户类别
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "OPT_CUACCT_GRP", oraConnDc)   # 期权资产账户组别
            tyzhAo.Insert_SYS_DD_ITEM(tableName, "OPT_CUACCT_LVL", oraConnDc)   # 期权资产账户级别

            # (4)系统参数—分支机构参数—开户模板设置
            tableName = "KBSSUSER.OPENTMPL_CFG"

            openNames = ["个人","机构","产品"]
            for openName in openNames :
                tyzhAo.Insert_OPENTMPL_CFG(tableName, openName)

            # (5)系统参数—系统序号管理—用户序号设置\资金序号设置;
            # 创建一个触发器
            tyzhAo.Create_Sequence()

            tableName = "KBSSUSER.SERIAL"

            seqNames = ["SEQ_CUACCT", "SEQ_CUACCT_BIZTYPE_2", "SEQ_CUACCT_BIZTYPE_3", "SEQ_CUACCT_BIZTYPE_4"]
            for seqName in seqNames :
                tyzhAo.Insert_SERIAL(tableName, seqName)

            # (6)证券业务—中登账户业务参数—账户开户代理点设置;
            tableName = "KBSSUSER.STK_ACCTBIZ_ORG"
            tyzhAo.Insert_STK_ACCTBIZ_ORG(tableName, "0", "260200")
            tyzhAo.Insert_STK_ACCTBIZ_ORG(tableName, "1", "00122")

            tableName = "KBSSUSER.STK_ACCTBIZ_AGENT_NEW"
            tyzhAo.Insert_STK_ACCTBIZ_AGENT_NEW(tableName)

            tableName = "KBSSUSER.STK_ACCTBIZ_CFG_NEW"
            tyzhAo.Insert_STK_ACCTBIZ_CFG_NEW(tableName)

            tableName = "KBSSUSER.STK_ACCTBIZ_ORG_NEW"
            print(tyzhAo.Rtn_Table_Desc(tableName))
            tyzhAo.Insert_STK_ACCTBIZ_ORG_NEW(tableName)

            # (7)新意机构代码对照设置(后台表XY_ORG设置);
            tableName = "KBSSUSER.XY_ORG"
            tyzhAo.Insert_XY_ORG(tableName)

            # (8)影像存储路径设置(后台表IMG_STORE_CFG);
            tableName = "KBSSUSER.IMG_STORE_CFG"
            tyzhAo.Insert_IMG_STORE_CFG(tableName)

            # (9)证券业务—交易单元参数—机构交易单元设置,从前端增加，注意信用交易单元的设置
            tableName = "KBSSUSER.STK_PBU_ORG"
            tyzhAo.Insert_STK_PBU_ORG(tableName, '0', '01', '260200', '0')  # 260200 深圳B股票席位
            tyzhAo.Insert_STK_PBU_ORG(tableName, '2', '20', '722000', '0')  # 722000 股转A股席位
            tyzhAo.Insert_STK_PBU_ORG(tableName, '1', '11', '90008', '0')  # 90008 上海B股席位
            tyzhAo.Insert_STK_PBU_ORG(tableName, '0', '00', '210000', '0')  # 210000 深圳A股信用席位
            tyzhAo.Insert_STK_PBU_ORG(tableName, '1', '10', '38070', '0')  # 38070 上海A股信用席位

            tyzhAo.Insert_STK_PBU_ORG(tableName, '0', '00', init["sza_unit"] , '1')   # 深圳A股交易单元
            tyzhAo.Insert_STK_PBU_ORG(tableName, '1', '10', init["sha_unit"], '1')  # 上海A股席位

            # 设置所加营业部资金账号产生规则
            tableName = "KBSSUSER.GENERATE_RULE"
            # print(tyzhAo.Rtn_Table_Desc(tableName))
            tyzhAo.Insert_GENERATE_RULE(tableName)

        # 设置任务状态
        task_run_status = 1

    except Exception as e:

        # 设置任务状态
        task_run_status = 3

        # time.sleep(0.5)
        # traceback.print_exc()

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









