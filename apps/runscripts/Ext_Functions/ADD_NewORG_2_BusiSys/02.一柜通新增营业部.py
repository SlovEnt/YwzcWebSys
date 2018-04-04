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

from apps.runscripts.Ext_Functions.ADD_NewORG_2_BusiSys.Current_Process import YGT_Add_Org, Back_Tables, \
    Table_Row_Is_Exist, Rtn_Table_Desc, Assembling_Insert_Sql, Assembling_Update_Sql


# 引入全局参数文件
currPath = os.path.dirname(os.path.realpath(__file__))
globParaList = Get_Param_Info("%s/Config.ini" % (currPath))


# 创建到账户库的链接
TY_TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SERVICE_NAME=%s)))' % (
    globParaList["TY_ORACLE_HOST"],
    globParaList["TY_ORACLE_PORT"],
    globParaList["TY_ORACLE_SERVICE_NAME"]
)
oraConnTyzh = cxOracle(
    globParaList["TY_ORACLE_USER_NAME"],
    globParaList["TY_ORACLE_USER_PASSWD"],
    TY_TNS_NAME
)

# 创建到数据中心的链接
DC_TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SID=%s)))' % (
    globParaList["DC_ORACLE_HOST"],
    globParaList["DC_ORACLE_PORT"],
    globParaList["DC_ORACLE_SERVICE_NAME"]
)
oraConnDc = cxOracle(
    globParaList["DC_ORACLE_USER_NAME"],
    globParaList["DC_ORACLE_USER_PASSWD"],
    DC_TNS_NAME
)  # 通过参数文件获取需要增加的一些信息

# 创建到一柜通的链接
DC_TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SID=%s)))' % (
    globParaList["YGT_ORACLE_HOST"],
    globParaList["YGT_ORACLE_PORT"],
    globParaList["YGT_ORACLE_SERVICE_NAME"]
)
oraConnYgt = cxOracle(
    globParaList["YGT_ORACLE_USER_NAME"],
    globParaList["YGT_ORACLE_USER_PASSWD"],
    DC_TNS_NAME
)


if __name__ == "__main__" :
    """ 为一柜通新增营业部运营参数脚本 """

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

            bSysName = "一柜通_{0}".format(init["org_code"])

            # 动态生成任务名称
            taskName = "{0}_{1}".format(bSysName, globParaList["YGT_ORACLE_HOST"])
            init["task_name"] = taskName

            # 保留的日志文件
            nowDate = datetime.datetime.now()
            strDate = nowDate.strftime("%Y%m%d%H%M%S")
            logFilePath = r"%s\%s\YGT_%s_%s_ADD_LOG.log" % (
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

            # 判断营业部在账户系统中是否已增加
            strSql = '''
                SELECT ORG_CODE AS ORG_CODE,
                       ORG_TYPE AS ORG_TYPE,
                       ORG_CLS AS ORG_CLS,
                       ORG_NAME AS ORG_NAME,
                       ORG_FULL_NAME AS ORG_FULL_NAME,
                       ORG_STATUS AS ORG_STATUS,
                       PARENT_ORG AS PAR_ORG,
                       ORG_CODE AS ORG_LVL,
                       ACCT_LEN AS ACCT_LEN,
                       ACCT_PREFIX AS ACCT_PREFIX,
                       AREA_NO AS AREA_NO,
                       ZIP_CODE AS ZIP_CODE,
                       AREA_ADDR AS AREA_ADDR,
                       TEL AS ORG_TEL,
                       ' ' AS NIGHT_MARKET,
                       ' ' AS LEGAL_ID,
                       ' ' AS REMARK,
                       ' ' AS IS_COMMON
                  FROM ORG
                 WHERE 0 = 0
                   AND ORG_TYPE = 0
                   AND ORG_CODE = '%s'
            ''' % init["org_code"]

            tyzhDatas = oraConnTyzh.QureyDict(strSql)

            if len(tyzhDatas) != 1:
                MSG_INFO["MSG_NO"] = 112200
                MSG_INFO["MSG_STR"] = "账户系统暂未增加或存有多条相关营业部参数，请等待完成后再继续！"
                raise ZeroDivisionError(MSG_INFO)

            log.PrintDebugLog("账户系统获取信息：%s" % str(tyzhDatas))

            tyzhInfo = tyzhDatas[0]

            # 提前备份数据表
            Back_Tables(log, oraConnYgt, "UEM_ORG_INFO", tyzhInfo["ORG_CODE"])

            ygtAo = YGT_Add_Org(init, oraConnYgt, mySqlConn, log)

            # 如果为C类营业部 需要完成如下工作
            # 1 判断母营业部是否存在；
            # 2 判断母营业部是否已有自己的行政区域：
                # 如果有则 取出行政区域编码，送入新增营业部 PAR_ORG 中
                # 如果无 则取出目前最大行政区域编码 进行+1 形成新的行政区域编码，行政区名称用母营业部简称 + A-C机构 模式命名 在将母营业部PAR_ORG字段更改为新的行政区域编码
            # 3 完成2动作后，再进行新增营业部写入操作

            # 判断是否为C类营业部 母营业部是否存在

            if init["central_org"] != "" or init["central_org"] != "999":
                MSG_INFO = ygtAo.Rtn_Exist_ParOrg()

                if MSG_INFO["MSG_RTN"] == False :
                    raise ZeroDivisionError(MSG_INFO)

                cenOrgName = MSG_INFO["MSG_CONTENT"][0]
                areaCode = MSG_INFO["MSG_CONTENT"][1]    # 母营业部 中心营业部 上级区域编码

                # 获取区域编码，如果母营业部区域编码等于999 则可以判断该母营业部还未划分区域 需要新插入一条区域信息
                if int(areaCode) == 999 :
                    rtnGMAC = ygtAo.Get_Mzx_AreaCode()
                    if rtnGMAC["MSG_RTN"] == True :
                        maxAreaCode = rtnGMAC["MSG_CONTENT"]
                    else:
                        raise ZeroDivisionError(MSG_INFO)

                    # 用母营业部名称机新区域来插入新的行政区域
                    tableName = "UEM_ORG_INFO"
                    # Rtn_Table_Desc(oraConnYgt, tableName)

                    ygtAo.Insert_AreaCode_Row(tableName, maxAreaCode, cenOrgName)

                else:
                    ''' 母营业部已有自己的编号 '''
                    maxAreaCode = areaCode

            else:
                ''' 没有母营业部，仅仅是AB类营业部新增 '''
                maxAreaCode = '999'

            # 增加新的营业部
            tableName = "UEM_ORG_INFO"
            ygtAo.Insert_New_OrgInfo_2_UEM_ORG_INFO(tableName, tyzhInfo, maxAreaCode)

            # 为交易部增加新营业部访问权限
            tableName = "POST_PERMISSION"
            # Rtn_Table_Desc(oraConnYgt, tableName)
            postId = 26 # 运营中心授权岗
            ygtAo.Insert_PostPermission_For_NewOrg(tableName, postId, maxAreaCode)
            ygtAo.Insert_PostPermission_For_NewOrg(tableName, postId, init["org_code"] )

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
