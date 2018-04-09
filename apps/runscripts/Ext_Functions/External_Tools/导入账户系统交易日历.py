
import os
import datetime
import json
import time
import schedule
import threading

from apps.runscripts.Ext_Functions.CommFuncs import C_PrintLog, Get_Param_Info, \
    cxOracle, Print_Dict_KandV, Gen_Now_Date, Dict2List



os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'
from apps.commset.GetSysInfo import mySqlConn


strSql = "select param_value from YwzcWebSys.commset_sysparam where param_en_name='CALENDAR_SOURCE'"

CParam = mySqlConn.query(strSql)
CParam = eval(CParam[0]["param_value"].replace("\r\n","").replace(" ",""))

print(CParam)

# 创建到账户库的链接
TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SERVICE_NAME=%s)))' % (
CParam["ORACLE_HOST"], CParam["ORACLE_PORT"], CParam["ORACLE_SERVICE_NAME"])
oraConn = cxOracle(CParam["ORACLE_USER_NAME"], CParam["ORACLE_USER_PASSWD"], TNS_NAME)

oraStrSql = "SELECT * FROM {0} A".format(CParam["TABLE_NAME"])

rtnDatas = oraConn.QueryDict(oraStrSql)

for x in rtnDatas:

    myStrSql = "select count(*) as cnt from `YwzcWebSys`.`commset_calendar` where `bookset` = '{0}' and  `physical_date` = {1}".format(x["BOOKSET"],x["PHYSICAL_DATE"])
    dx = mySqlConn.query(myStrSql)[0]

    if str(dx["cnt"]) == "0":

        myStrSql = "INSERT INTO `YwzcWebSys`.`commset_calendar` (`bookset`, `physical_date`, `date_flag`, `date_status`) VALUES ('{0}', '{1}', '{2}', '{3}');".format(
            x["BOOKSET"],
            x["PHYSICAL_DATE"],
            x["DATE_FLAG"],
            x["DATE_STATUS"],
        )

        mySqlConn.execute(myStrSql)

    else:
        print("skip")







