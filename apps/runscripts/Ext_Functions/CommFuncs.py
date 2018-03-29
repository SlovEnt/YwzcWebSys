
import re
import datetime
import os
import cx_Oracle
from openpyxl import load_workbook
import traceback
import paramiko
import time
import sys

import redis
class RedisQueue(object):
    def __init__(self, name, namespace='Queue', **redis_kwargs):
       # redis的默认参数为：host='localhost', port=6379, db=0， 其中db为定义redis database的数量
       self.__db= redis.Redis(host='192.168.169.30', port=6379)
       self.key = '%s:%s' %(namespace, name)

    def qsize(self):
        return self.__db.llen(self.key)  # 返回队列里面list内元素的数量

    def put(self, item):
        self.__db.rpush(self.key, item)  # 添加新元素到队列最右方

    def get_wait(self, timeout=None):
        # 返回队列第一个元素，如果为空则等待至有元素被加入队列（超时时间阈值为timeout，如果为None则一直等待）
        item = self.__db.blpop(self.key, timeout=timeout)
        # if item:
        #     item = item[1]  # 返回值为一个tuple
        return item

    def get_nowait(self):
        # 直接返回队列第一个元素，如果队列为空返回的是None
        item = self.__db.lpop(self.key)
        return item


class cxOracle(object):
    '''
    tns的取值tnsnames.ora对应的配置项的值，如：
    tns = '(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.16.18.23)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MYDB)))'
    '''

    def __init__(self, uname, upwd, tns):
        self._uname = uname
        self._upwd = upwd
        self._tns = tns
        self._conn = None
        self._ReConnect()

    def _ReConnect(self):
        if not self._conn:
            self._conn = cx_Oracle.connect(self._uname, self._upwd, self._tns)
        else:
            pass

    def __del__(self):
        if self._conn:
            self._conn.close()
            self._conn = None

    def _NewCursor(self):
        cur = self._conn.cursor()
        if cur:
            return cur
        else:
            print("#Error# Get New Cursor Failed.")
            return None

    def _DelCursor(self, cur):
        if cur:
            cur.close()

    # 检查是否允许执行的sql语句
    def _PermitedUpdateSql(self, sql):
        rt = True
        lrsql = sql.lower()
        sql_elems = [lrsql.strip().split()]

        # update和delete最少有四个单词项
        if len(sql_elems) < 4:
            rt = False
        # 更新删除语句，判断首单词，不带where语句的sql不予执行
        elif sql_elems[0] in ['update', 'delete']:
            if 'where' not in sql_elems:
                rt = False

        return rt

    # 导出结果为文件
    def Export(self, sql, file_name, colfg='||'):
        rt = self.Query(sql)
        if rt:
            with open(file_name, 'a') as fd:
                for row in rt:
                    ln_info = ''
                    for col in row:
                        ln_info += str(col) + colfg
                    ln_info += '\n'
                    fd.write(ln_info)

    # 查询
    def Query(self, sql, nStart=0, nNum=- 1):
        rt = []

        # 获取cursor
        cur = self._NewCursor()
        if not cur:
            return rt

        # 查询到列表
        cur.execute(sql)
        if (nStart == 0) and (nNum == 1):
            rt.append(cur.fetchone())
        else:
            rs = cur.fetchall()
            if nNum == - 1:
                rt.extend(rs[nStart:])
            else:
                rt.extend(rs[nStart:nStart + nNum])

        # 释放cursor
        self._DelCursor(cur)

        return rt

    # 字段名
    def QueryDesc(self, sql, nStart=0, nNum=- 1):
        rt = []

        # 获取cursor
        cur = self._NewCursor()
        if not cur:
            return rt

        # 查询到列表
        cur.execute(sql)
        descList = [i[0] for i in cur.description]

        # 释放cursor
        self._DelCursor(cur)

        return descList

    # 更新
    def Exec(self, sql):
        # 获取cursor
        rt = None
        cur = self._NewCursor()
        if not cur:
            return rt

        # 判断sql是否允许其执行
        # if not self._PermitedUpdateSql(sql):
        #     return rt

        # 执行语句
        rt = cur.execute(sql)

        # 提交事物
        self._conn.commit()

        # 释放cursor
        self._DelCursor(cur)

        return rt


class C_PrintLog(object):
    def __init__(self, logFile=""):
        self.logFile = logFile

    def PrintDebugLog(self, msg=""):
        now = datetime.datetime.now()
        print("\033[1;34mDEBUG INFO: " + now.strftime("%Y-%m-%d %H:%M:%S") + ":\033[0m", msg)
        self.logFile.write(now.strftime("%Y-%m-%d %H:%M:%S") + ": " + msg + "\n")

    def PrintErrorLog(self, msg=""):
        now = datetime.datetime.now()
        print("\033[1;31mERROR INFO: " + now.strftime("%Y-%m-%d %H:%M:%S") + ":\033[0m", msg)
        self.logFile.write(now.strftime("%Y-%m-%d %H:%M:%S") + ": " + msg + "\n")

    def PrintWarningLog(self, msg=""):
        now = datetime.datetime.now()
        print("\033[1;31mWarning INFO: " + now.strftime("%Y-%m-%d %H:%M:%S") + ":\033[0m", msg)
        self.logFile.write(now.strftime("%Y-%m-%d %H:%M:%S") + ": " + msg + "\n")

    def debug(msg=""):
        now = datetime.datetime.now()
        return "\033[1;34mDEBUG INFO: " + now.strftime("%Y-%m-%d %H:%M:%S") + ":\033[0m"

    def errinfo(msg=""):
        now = datetime.datetime.now()
        return "\033[1;31mERROR INFO: " + now.strftime("%Y-%m-%d %H:%M:%S") + ":\033[0m"

    def tmpinfo(msg=""):
        now = datetime.datetime.now()
        if msg != "":
            msg = " " + msg
        return "\033[1;32mTEMP INFO: " + now.strftime("%Y-%m-%d %H:%M:%S") + msg + ":\033[0m"

    def Time_Remain(msg, showMins):
        now = datetime.datetime.now()
        cnt = 0
        while (cnt < showMins):
            cnt += 1
            n = showMins - cnt
            time.sleep(1)
            sys.stdout.write("\r" + "\033[1;34mDEBUG INFO: " + now.strftime("%Y-%m-%d %H:%M:%S") + ":\033[0m " +  msg %(n) , )
            if  cnt == showMins:
                sys.stdout.write("\n")
            sys.stdout.flush()
            if not n:
                return "完成"


def Get_Now_Date(dateFormat):

    nowDate = datetime.datetime.now()
    Y = nowDate.strftime("%Y")
    M = nowDate.strftime("%m")
    D = nowDate.strftime("%d")

    if dateFormat == "y-m-d" or dateFormat == "Y-M-D":
        strDate = str(Y)+"-"+str(int(M))+"-"+str(int(D))
    elif dateFormat == "yyyy-mm-dd" or dateFormat == "YYYY-MM-DD":
        strDate = str(Y)+"-"+str(M)+"-"+str(D)
    elif dateFormat == "yyyymmdd" or dateFormat == "YYYYMMDD":
        strDate = str(Y)+str(M)+str(D)
    elif dateFormat == "yyyymmdd_HHMMSS" or dateFormat == "YYYYMMDD_HHMMSS":
        strDate = nowDate.strftime("%Y%m%d_%H%M%S")
    else:
        return 'Get_Now_Date("%s"),入参无效' % dateFormat

    return strDate

def Get_Param_Info(ConfigFile):

    if os.path.isfile(ConfigFile) == False:
        raise Exception("错误，全局参数配置文件不存在")

    paramInfo = {}
    for line in open(ConfigFile,"r",encoding= 'UTF-8'):
        if line != "\n" :
            info = line.strip("\n")
            # 首字符为 # ; 等符号 视为注释
            if info.strip()[0] != "#" and info.strip()[0] != ";" and info.strip()[0] != "[" :
                # print(info.strip()[0])
                info = info.split("=")
                if len(info) == 2:
                    paramName = info[0].strip()
                    paramValue = info[1].strip()
                    paramInfo[paramName] = paramValue
    return paramInfo

def Get_ExcludeList(xlsFile,xlsSheetName):
    # 读取Excek文件
    xlsWBook = load_workbook(xlsFile)
    xlsWSheet = xlsWBook.get_sheet_by_name(xlsSheetName)
    startRow = 2  # 起始行号
    xlsRowList = []

    colCnt = len(list(xlsWSheet.columns))
    rowCnt = len(list(xlsWSheet.rows))
    xlsWSheet = list(xlsWSheet.rows)

    xSn = 0
    for rowv in range(1, rowCnt):
        xSn = xSn + 1
        colDict={}
        for colv in range(0, colCnt):
            if xlsWSheet[rowv][colv].value == None:
                valueX = ""
            else:
                valueX = xlsWSheet[rowv][colv].value

                # 如果Excel里的变量为字符型，则去前后空格，减免出错几率
                if isinstance(valueX,str) == True:
                    valueX = valueX.strip()

            colDict[xlsWSheet[0][colv].value] = valueX
            colDict["xSn"] = xSn
        if int(colDict["处理标志"][0]) == 0:
            xlsRowList.append(colDict)

    return xlsRowList

def Dict2List(dic:dict):
    ''' 将字典转化为列表 '''
    keys = dic.keys()
    vals = dic.values()
    lst = [(key, val) for key, val in zip(keys, vals)]
    return lst

def Gen_Now_Date(dateFormat=""):
    # 生成当日日期格式
    try:
        nowDate = datetime.datetime.now()
        Y = nowDate.strftime("%Y")
        M = nowDate.strftime("%m")
        D = nowDate.strftime("%d")

        if dateFormat == "y-m-d":
            strDate = str(Y) + "-" + str(int(M)) + "-" + str(int(D))
        elif dateFormat == "yyyy-mm-dd":
            strDate = str(Y) + "-" + str(M) + "-" + str(D)
        elif dateFormat == "yyyymmdd":
            strDate = str(Y) + str(M) + str(D)
        elif dateFormat == "yyyymmdd_HHMMSS":
            strDate = nowDate.strftime("%Y%m%d_%H%M%S")
        elif dateFormat == "":
            return False, 'Get_Now_Date(dateFormat) 函数入参不能为空'
        else:
            return False, 'Get_Now_Date("%s") 函数入参格式无效' % dateFormat

        return True,strDate

    except Exception as e:
        print(e)

def Get_SSH_Hander(hostIP, userName, userPasswd):
    sshCmd = paramiko.SSHClient()
    sshCmd.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    sshCmd.connect(hostIP, 22, userName, userPasswd)
    return sshCmd

def Get_Linux_Env_NLS_LANG(sshCmd):
    '''取Oracle用户下的字符集编码'''
    strCMD = "cat ~/.bash_profile |grep NLS_LANG"
    stdin, stdout, stderr = sshCmd.exec_command(strCMD)
    for std in stdout.readlines():
        if "#" not in std.strip("\n"):
            dataReg = re.compile(r"""export NLS_LANG=["|'](.+?)['|"]""")
            rawDatas = dataReg.findall(std.strip("\n"))
            if len(rawDatas) == 1:
                return rawDatas[0]
    return False

def Comp_MultilineText(multStr):
    ''' 压缩多行文本代码，主要用于多行SQL压缩为一行 '''
    line = multStr.splitlines()
    ''' 如果行数不仅仅只为一行，则进行多行处理模式 '''
    if len(line) != 1 :
        newSql = ""
        for x in line:
            newSql = newSql + " " + x.lstrip()
            newSql = re.sub(r'\s{2,}',' ',newSql)
        return newSql.lstrip().rstrip()
    else:
        ''' 单行只需要去除前后空格即可 '''
        return multStr.lstrip().rstrip()

def Get_Trading_Day():
    # 获取交易日,通过组策略下发的文本文件
    todayYMD = time.strftime("%Y%m%d", time.localtime())  # YYYYMMDD
    tradeDayFile = r"C:\Windows\HolidayList.txt"
    fileRdade = open(tradeDayFile)
    line = fileRdade.readline()
    while line:
        strFlag = line.split(" ")
        if todayYMD == strFlag[0] and int(strFlag[1]) == 2:
            return False
        line = fileRdade.readline()
    fileRdade.close()
    return True

def Get_Last_Trading_Day(dfDay):
    # 获取交易日,通过组策略下发的文本文件取上一个交易日

    nowDay = datetime.datetime.now()

    deltaDayNum = int(dfDay)

    ''' 日历由域控下发，不在域控的机器需要手工拷贝文件到该目录 '''
    tradeDayFile = r"C:\Windows\HolidayList.txt"
    fileRdade = open(tradeDayFile)

    dayFlagArr = []
    for line in fileRdade.readlines():
        ''' 合并字典日期和节假日标志，保持为无空格字符串用于匹配比对 '''
        dayFlag = line.strip("\n").replace(" ", "")
        dayFlagArr.append(dayFlag)

    while True :

        ''' 日期计算 得出指定的上一个交易日 '''
        deltaDay = datetime.timedelta(days=deltaDayNum)
        lastTradeDay = nowDay - deltaDay
        lastTradeDayX = lastTradeDay.strftime('%Y%m%d')
        lastTradeDay = "%s1" % lastTradeDay.strftime('%Y%m%d') # YYYYMMDDF F=标志（1或2）

        if lastTradeDay in dayFlagArr:
            ''' 如果计算出的交易日加标识包含在数组内，则认为当前日期为交易日 '''
            return lastTradeDayX
        elif deltaDayNum > 365 :
            ''' 如果循环日期超过365次，不可能会出现连续放假365天的可能，则基本认为是交易日历有问题 '''
            return False

        ''' 如果是非交易日，则计数累计加1 取再上一天 '''
        deltaDayNum = deltaDayNum + 1

    return False


