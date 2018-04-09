from .GetSysInfo import mySqlConn
from apps.runscripts.Ext_Functions.CommFuncs import cxOracle
import time

# 固定计划任务类 用于注册定期执行的计划 手工设置 目前没有找到从数据库中加载的办法
from apscheduler.schedulers.blocking import BlockingScheduler  # 阻塞
from apscheduler.schedulers.background import BackgroundScheduler # 非阻塞

scheduler = BackgroundScheduler()

# 定义计划任务 每年12月10号开始从账户系统中导入交易日历
# @sched.interval_schedule(seconds=30)
@scheduler.scheduled_job("cron", month='12', day='25-31', hour='0-3', minute='10')  # 每年的12月20日开始 每天的0-3点的00分开始执行导入
def Schedule_ImportCalendar():

    strSql = "select param_value from YwzcWebSys.commset_sysparam where param_en_name='CALENDAR_SOURCE'"
    CParam = mySqlConn.query(strSql)
    CParam = eval(CParam[0]["param_value"].replace("\r\n", "").replace(" ", ""))

    # 创建到账户库的链接
    TNS_NAME = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SERVICE_NAME=%s)))' % (
        CParam["ORACLE_HOST"], CParam["ORACLE_PORT"], CParam["ORACLE_SERVICE_NAME"])

    try:
        oraConn = cxOracle(CParam["ORACLE_USER_NAME"], CParam["ORACLE_USER_PASSWD"], TNS_NAME)
    except Exception as e:
        print(e)

    YYYY = time.strftime("%Y", time.localtime())
    lastYYYY = int(YYYY) + 1

    oraStrSql = "SELECT * FROM {0} A WHERE A.PHYSICAL_DATE BETWEEN '{1}0101' AND '{1}1231'".format(CParam["TABLE_NAME"], lastYYYY)

    rtnDatas = oraConn.QueryDict(oraStrSql)

    for x in rtnDatas:

        myStrSql = "select count(*) as cnt from `YwzcWebSys`.`commset_calendar` where `bookset` = '{0}' and  `physical_date` = {1}".format(
            x["BOOKSET"], x["PHYSICAL_DATE"])
        dx = mySqlConn.query(myStrSql)[0]

        if str(dx["cnt"]) == "0":

            myStrSql = "INSERT INTO `YwzcWebSys`.`commset_calendar` (`bookset`, `physical_date`, `date_flag`, `date_status`) VALUES ('{0}', '{1}', '{2}', '{3}');".format(
                x["BOOKSET"],
                x["PHYSICAL_DATE"],
                x["DATE_FLAG"],
                x["DATE_STATUS"],
            )
            mySqlConn.execute(myStrSql)



# def ImportCalendar1():
#     print("34734857834754389")









scheduler.start()

