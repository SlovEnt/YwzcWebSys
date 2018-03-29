import os
import sys
os.environ['DJANGO_SETTINGS_MODULE'] = 'YwzcWebSys.settings'

from apps.commset.GetSysInfo import mySqlConn

# from commset.models import SysParam, GetSysDict


def RunMainPoint():

    sqlStr = "select * from backtaskmget_filebacktaskset where proc_flag = 'Y';"

    xList = mySqlConn.query(sqlStr)

    for x in xList:
        print(x)
        runTime = x["task_run_time"]
        print(runTime)







if __name__ == "__main__" :

    RunMainPoint()


