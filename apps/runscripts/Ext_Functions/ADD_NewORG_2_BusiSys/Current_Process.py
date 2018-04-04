
def Back_Tables(log, oraConn, tableName, tableExtName):
    ''' 备份数据表 '''
    if "." in tableName:
        singTableName = tableName.split(".")[1]
    else:
        singTableName = tableName

    log.PrintDebugLog("正在备份 %s 表，请稍后！" % tableName)
    strSql = "SELECT COUNT(*) FROM ALL_TABLES WHERE OWNER = 'CHDB' AND TABLE_NAME='A_%s_%s'" % \
    (tableExtName, singTableName)
    rtnCnt = oraConn.Query(strSql)[0][0]

    if rtnCnt == 0:
        strSql = '''CREATE TABLE CHDB."A_%s_%s" AS SELECT * FROM %s''' % (tableExtName, singTableName, tableName)
        oraConn.Exec(strSql)
        log.PrintDebugLog("备份语句：%s" % strSql)
        log.PrintDebugLog("还原语句：TRUNCATE TABLE %s;" % (tableName))
        log.PrintDebugLog(
            '''还原语句：INSERT INTO %s SELECT * FROM CHDB."A_%s_%s";''' % (tableName, tableExtName, singTableName))
        log.PrintDebugLog('''还原语句：COMMIT;\n''')
    else:
        log.PrintDebugLog("CHDB.A_%s_%s 已存在，跳过本次备份！\n" % (tableExtName, singTableName))

def Get_SEQUENCES_NEXTVAL(oraConn, seqName):
    strSql = "SELECT {0}.NEXTVAL FROM DUAL".format(seqName)
    try:
        seqNextVal = oraConn.Query(strSql)[0][0]
        return seqNextVal
    except Exception as e:
        return False

def Create_Msg():
    ''' 创建一个MSG空间 '''
    MSG_INFO = {}
    MSG_INFO["MSG_RTN"] = True
    MSG_INFO["MSG_NO"] = 0
    MSG_INFO["MSG_STR"] = "初始消息空间"
    MSG_INFO["MSG_CONTENT"] = ""
    return MSG_INFO

def Rtn_Table_Desc(oraConn, tableName):
    ''' 返回查询表的字段信息 '''
    strSql = "SELECT * FROM {0} WHERE 0 <> 0".format(tableName)
    descList = oraConn.QueryDesc(strSql)
    print(strSql)
    for desc in descList:
        print("fieldValue['{0}'] = ".format(desc ))
    return descList

def Table_Row_Is_Exist(oraConn, tableName, kwargs):
    ''' 返回指定条件下返回的ROW数据总数 '''
    strSql = "SELECT COUNT(*) AS CNT FROM {0} WHERE 0=0 ".format(tableName)
    strWhere = ""
    for key, value in kwargs.items():
        strWhere = strWhere + "AND {0}='{1}' ".format(key, value)
    strSql = strSql + strWhere
    # print(strSql)
    rtnCnt = oraConn.Query(strSql)[0][0]
    return  (rtnCnt, " "+strWhere.replace(strWhere[0:4],""), strSql)

def Assembling_Insert_Sql(oraConn, tableName, kwargs):
    fieldList = ""
    valueList = ""
    for key, value in kwargs.items():
        if fieldList == "":
            fieldList = "{0}".format(key)
            valueList = "'{0}'".format(value)
        else:
            fieldList = "{0}, {1}".format(fieldList, key)
            valueList = "{0}, '{1}'".format(valueList, value)
    strSql = "INSERT INTO {0} ({1}) VALUES ({2})".format(tableName, fieldList, valueList)
    try:
        oraConn.Exec(strSql)
        return True
    except Exception as e:
        return e

def Assembling_Update_Sql(oraConn, tableName, kwargs, setFieldList):
    ''' 入参格式 第一个字典为条件字典 第二个是SET字段（列表格式） '''

    # 分拆字典 把原始字典分拆为两个SQL语句段 条件 SET
    strWhereSql = ""
    strSetSql = ""
    strQuerySql = ""

    for setField in setFieldList:
        for key, value in kwargs.items():
            if key == setField :
                # SET 语句
                if strSetSql == "":
                    strSetSql = "%s='%s'" % (key, value)
                    strQuerySql = "%s" % (key)
                else:
                    strSetSql = strSetSql + ", %s='%s'" % (key, value)
                    strQuerySql = strQuerySql + ", %s" % (key)

    for setField in setFieldList:
        ''' 从入参字典中删除要SET的字段值 '''
        del kwargs[setField]

    for key, value in kwargs.items():
        ''' 在剩余字典项目中组装Where 语句 '''
        strWhereSql = strWhereSql + " AND %s='%s'" % (key, value)

    # 查询回系统的旧值，返回给日志中记录
    strSqlQuery = "SELECT {2} FROM {0} WHERE 0=0{1}".format(tableName, strWhereSql, strQuerySql)
    oldDatas = oraConn.Query(strSqlQuery)[0]

    ''' 最终组装UPDATE全语句 '''
    strSql = "UPDATE {0} SET {1} WHERE 0=0{2}".format(tableName, strSetSql, strWhereSql)
    try:
        oraConn.Exec(strSql)
        return (True, strSetSql, strWhereSql, oldDatas)
    except Exception as e:
        return (e, strSetSql, strWhereSql, oldDatas)


class Tyzh_Add_Org(object):

    def __init__(self, ginsengDict, oraConn, mySqlConn, log):
        self.info = ginsengDict
        self.oraConn = oraConn
        self.mySqlConn = mySqlConn
        self.log = log
        # self.MSG_INFO = {}
        # self.MSG_INFO["MSG_NO"] = 0
        # self.MSG_INFO["MSG_STR"] = "初始消息空间"

    def Create_Msg(self):
        MSG_INFO = {}
        MSG_INFO["MSG_NO"] = 0
        MSG_INFO["MSG_STR"] = "初始消息空间"
        return MSG_INFO

    def Back_Tables(self, tableName):
        self.log.PrintDebugLog("正在备份 %s 表，请稍后！" % tableName)
        strSql = "SELECT COUNT(*) FROM ALL_TABLES WHERE OWNER = 'CHDB' AND TABLE_NAME='A_%s_%s'" % (self.info["org_code"], tableName)
        rtnCnt = self.oraConn.Query(strSql)[0][0]

        if rtnCnt == 0:
            strSql = '''CREATE TABLE CHDB."A_%s_%s" AS SELECT * FROM %s''' % (self.info["org_code"], tableName, tableName)
            self.oraConn.Exec(strSql)
            self.log.PrintDebugLog("备份语句：%s" % strSql)
            self.log.PrintDebugLog("还原语句：TRUNCATE TABLE %s;" % (tableName))
            self.log.PrintDebugLog(
                '''还原语句：INSERT INTO %s SELECT * FROM CHDB."A_%s_%s";''' % (tableName, self.info["org_code"], tableName))
            self.log.PrintDebugLog('''还原语句：COMMIT;\n''')
        else:
            self.log.PrintDebugLog("CHDB.A_%s_%s 已存在，跳过本次备份！\n" % (self.info["org_code"], tableName))

    def Create_Sequence(self):
        if len(self.info["org_code"]) == 2:
            orgCodeFull = "00" + str(self.info["org_code"])
        else:
            orgCodeFull = "0" + str(self.info["org_code"])

        strSql = "SELECT COUNT(*) FROM USER_OBJECTS WHERE OBJECT_TYPE = 'SEQUENCE' AND OBJECT_NAME = 'KBSS_SEQ_CUACCT_%s'" % orgCodeFull
        rtnCnt = self.oraConn.Query(strSql)[0][0]
        if rtnCnt == 0:
            strSql = '''
                create sequence KBSS_SEQ_CUACCT_%s
                minvalue 1
                maxvalue 999999999999
                start with 1
                increment by 1
                cache 100
            ''' % orgCodeFull
            self.log.PrintDebugLog("SEQUENCE KBSS_SEQ_CUACCT_%s 在系统生成！" % orgCodeFull)
            self.oraConn.Exec(strSql)
        else:
            self.log.PrintWarningLog("SEQUENCE KBSS_SEQ_CUACCT_%s 在系统中已存在，跳过相关操作！" % orgCodeFull)

    def Rtn_Table_Desc(self,tableName):
        strSql = "SELECT * FROM {0} WHERE 0 <> 0".format(tableName)
        descList = self.oraConn.QueryDesc(strSql)
        print(strSql)
        for desc in descList:
            print("fieldValue['{0}'] = ".format(desc ))
        return descList

    def Table_Row_Is_Exist(self, tableName, kwargs):
        ''' 返回指定条件下返回的ROW数据总数 '''
        strSql = "SELECT COUNT(*) AS CNT FROM {0} WHERE 0=0 ".format(tableName)
        strWhere = ""
        for key, value in kwargs.items():
            strWhere = strWhere + "AND {0}='{1}' ".format(key, value)
        strSql = strSql + strWhere
        rtnCnt = self.oraConn.Query(strSql)[0][0]
        # self.log.PrintDebugLog("%s %s" % (rtnCnt, strSql))
        return  (rtnCnt, strWhere.replace(strWhere[0:3],""), strSql)

    def Assembling_Insert_Sql(self, tableName, kwargs):
        fieldList = ""
        valueList = ""
        for key, value in kwargs.items():
            if fieldList == "":
                fieldList = "{0}".format(key)
                valueList = "'{0}'".format(value)
            else:
                fieldList = "{0}, {1}".format(fieldList, key)
                valueList = "{0}, '{1}'".format(valueList, value)
        strSql = "INSERT INTO {0} ({1}) VALUES ({2})".format(tableName, fieldList, valueList)
        self.log.PrintDebugLog("%s" % (strSql))
        try:
            self.oraConn.Exec(strSql)
            return True
        except Exception as e:
            return e

    def Assembling_Update_Sql(self, tableName, kwargs, setFieldList):
        ''' 入参格式 第一个字典为条件字典 第二个是SET字段（列表格式） '''

        # 分拆字典 把原始字典分拆为两个SQL语句段 条件 SET
        strWhereSql = ""
        strSetSql = ""
        strQuerySql = ""

        for setField in setFieldList:
            for key, value in kwargs.items():
                if key == setField :
                    # SET 语句
                    if strSetSql == "":
                        strSetSql = "%s='%s'" % (key, value)
                        strQuerySql = "%s" % (key)
                    else:
                        strSetSql = strSetSql + ", %s='%s'" % (key, value)
                        strQuerySql = strQuerySql + ", %s" % (key)

        for setField in setFieldList:
            ''' 从入参字典中删除要SET的字段值 '''
            del kwargs[setField]

        for key, value in kwargs.items():
            ''' 在剩余字典项目中组装Where 语句 '''
            strWhereSql = strWhereSql + " AND %s='%s'" % (key, value)

        # 查询回系统的旧值，返回给日志中记录
        strSqlQuery = "SELECT {2} FROM {0} WHERE 0=0{1}".format(tableName, strWhereSql, strQuerySql)
        oldDatas = self.oraConn.Query(strSqlQuery)[0]

        ''' 最终组装UPDATE全语句 '''
        strSql = "UPDATE {0} SET {1} WHERE 0=0{2}".format(tableName, strSetSql, strWhereSql)
        self.log.PrintDebugLog("%s" % (strSql))
        try:
            self.oraConn.Exec(strSql)
            return (True, strSetSql, strWhereSql, oldDatas)
        except Exception as e:
            return (e, strSetSql, strWhereSql, oldDatas)

    def Insert_ORG(self, tableName):

        fieldValue = {}
        MSG_INFO = self.Create_Msg()

        fieldValue['ORG_CODE'] = self.info["org_code"]
        fieldValue['ORG_TYPE'] = "0"
        fieldValue['ORG_CLS'] = "02"

        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 120001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            fieldValue['ORG_NAME'] = self.info["org_name"]
            fieldValue['ORG_FULL_NAME'] = self.info["org_fname"]
            fieldValue['ORG_STATUS'] = "0"
            fieldValue['PARENT_ORG'] = "999"
            fieldValue['ACCT_LEN'] = len(self.info["org_code"]) + 8
            fieldValue['ACCT_PREFIX'] = self.info["org_code"]
            fieldValue['AREA_NO'] = self.info["area_code"]
            fieldValue['ZIP_CODE'] = self.info["post_code"]
            fieldValue['AREA_ADDR'] = self.info["address"]
            fieldValue['TEL'] = self.info["tel"]
            fieldValue['OPEN_DATE'] = self.info["oper_date"]
            fieldValue['UPD_DATE'] = '0'

            rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)

            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_USER_RTOBJ(self, tableName):

        MSG_INFO = self.Create_Msg()

        strSql = "SELECT A.OP_CODE,B.USER_NAME FROM OPERATOR A INNER JOIN USERS B ON A.OP_CODE=B.USER_CODE WHERE A.INT_ORG = 999 AND A.OP_STATUS = '0'"
        rtnDatas = self.oraConn.Query(strSql)

        if len(rtnDatas) != 0:
            for rtnData in rtnDatas :
                fieldValue = {}
                fieldValue['USER_CODE'] = rtnData[0]
                fieldValue['USER_ROLE'] = '2'
                fieldValue['GRANT_TYPE'] = '1'
                fieldValue['RTOBJ_TYPE'] = '0'
                fieldValue['RTOBJ_CLS'] = '00'
                fieldValue['RTOBJ'] = self.info["org_code"]

                rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

                if rtnDates[0] != 0:
                    MSG_INFO["MSG_NO"] = 120001
                    MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                    self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                else:
                    rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                    if rtnMsg == True:
                        MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                        self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                    else:
                        MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                        self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            MSG_INFO["MSG_NO"] = 120002
            MSG_INFO["MSG_STR"] = "{0} 表里没有任何待授权的操作员记录，忽略本次处理！".format("OPERATOR")
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_SYS_DD_ITEM(self, tableName, ddId, oraConnDc):

        MSG_INFO = self.Create_Msg()

        if ddId == "COM_MODEL":
            '''佣金模板 目前账户系统中该字典没有任何设置信息'''
            pass
        elif ddId == "CUACCT_CLS":
            # 对照柜台 JZ30.TCL_ACC_CLS_SETTING 表
            strSql = "SELECT ACC_CLS, ACC_CLS_NAME FROM JZ30.TCL_ACC_CLS_SETTING WHERE BRANCH = '%s' ORDER BY ACC_CLS" % self.info["org_code"]
            rtnCntDc = oraConnDc.Query(strSql)
            if len(rtnCntDc) == 0:
                self.log.PrintWarningLog("CUACCT_CLS 柜台映射表 JZ30.TCL_ACC_CLS_SETTING 中未设置任何值，暂时跳过本步骤！")
            else:
                for orgItem in rtnCntDc:
                    ''' 根据 ACC_CLS 来判断字典中是否存在相关值'''

                    fieldValue = {}
                    fieldValue['DD_ID'] = ddId
                    fieldValue['DD_ITEM'] = orgItem[0]
                    fieldValue['INT_ORG'] = self.info["org_code"]

                    rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)
                    if rtnDates[0] == 0:
                        ''' 不存在则直接增加 '''
                        fieldValue['DD_ITEM_NAME'] = orgItem[1]
                        rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                        if rtnMsg == True:
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                            self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                        else:
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                            self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                    else:
                        ''' 存在还需要判断 DD_ITEM_NAME 值是否一致，不一致则按柜台的修改'''
                        fieldValue['DD_ITEM_NAME'] = orgItem[1]
                        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

                        if rtnDates[0] != 0:
                            ''' 完全一致，不做任何修改 '''
                            MSG_INFO["MSG_NO"] = 120004
                            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                        else:
                            ''' 字典名称不一致，按柜台的修改 '''
                            # 定义需要修改的字段列表
                            setFieldList = ["DD_ITEM_NAME"]
                            rtnMsg = self.Assembling_Update_Sql(tableName, fieldValue, setFieldList)
                            if rtnMsg[0] == True :
                                MSG_INFO["MSG_NO"] = 120005
                                MSG_INFO["MSG_STR"] = "{0} 表中条件为 {2} 已有 {3} 的记录，但数据结果与柜台不一致,使用UPDATE 修改为 {1}！".format(tableName, rtnMsg[1], rtnMsg[2], rtnMsg[3] )
                                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                            else:
                                MSG_INFO["MSG_NO"] = 120105
                                MSG_INFO["MSG_STR"] = "{0} 表中使用UPDATE 条件为 {2} 设置 {1} 的记录失败！数据库返回消息为：{3}".format(tableName, rtnMsg[1], rtnMsg[2], rtnMsg[0] )
                                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        elif ddId == "FISL_CUACCT_CLS":
            # 对照柜台 JZ30.TCL_ACC_CLS_SETTING 表
            strSql = "SELECT ACC_CLS, ACC_CLS_NAME FROM JZ40.TCL_ACC_CLS_SETTING WHERE BRANCH = '%s' ORDER BY ACC_CLS" % self.info["org_code"]
            rtnCntDc = oraConnDc.Query(strSql)
            if len(rtnCntDc) == 0:
                self.log.PrintWarningLog("FISL_CUACCT_CLS 柜台映射表 JZ40.TCL_ACC_CLS_SETTING 中未设置任何值，暂时跳过本步骤！")
            else:
                for orgItem in rtnCntDc:
                    ''' 根据 ACC_CLS 来判断字典中是否存在相关值'''

                    fieldValue = {}
                    fieldValue['DD_ID'] = ddId
                    fieldValue['DD_ITEM'] = orgItem[0]
                    fieldValue['INT_ORG'] = self.info["org_code"]

                    rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)
                    if rtnDates[0] == 0:
                        ''' 不存在则直接增加 '''
                        fieldValue['DD_ITEM_NAME'] = orgItem[1]
                        MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                        rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                        self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                    else:
                        ''' 存在还需要判断 DD_ITEM_NAME 值是否一致，不一致则按柜台的修改'''
                        fieldValue['DD_ITEM_NAME'] = orgItem[1]
                        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

                        if rtnDates[0] != 0:
                            ''' 完全一致，不做任何修改 '''
                            MSG_INFO["MSG_NO"] = 120004
                            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                        else:
                            ''' 字典名称不一致，按柜台的修改 '''
                            # 定义需要修改的字段列表
                            setFieldList = ["DD_ITEM_NAME"]
                            rtnMsg = self.Assembling_Update_Sql(tableName, fieldValue, setFieldList)
                            if rtnMsg[0] == True :
                                MSG_INFO["MSG_NO"] = 120005
                                MSG_INFO["MSG_STR"] = "{0} 表中条件为 {2} 已有 {3} 的记录，但数据结果与柜台不一致,使用UPDATE 修改为 {1}！".format(tableName, rtnMsg[1], rtnMsg[2], rtnMsg[3] )
                                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                            else:
                                MSG_INFO["MSG_NO"] = 120105
                                MSG_INFO["MSG_STR"] = "{0} 表中使用UPDATE 条件为 {2} 设置 {1} 的记录失败！数据库返回消息为：{3}".format(tableName, rtnMsg[1], rtnMsg[2], rtnMsg[0] )
                                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        elif ddId == "CUACCT_CLS_FEE_SN":
            # 对照数据中心 Z30.TCL_CLS_FEE 表
            strSql = "SELECT CLS_FEE, CLS_FEE_NAME FROM JZ30.TCL_CLS_FEE WHERE BRANCH = '%s' ORDER BY CLS_FEE"  % self.info["org_code"]
            rtnCntDc = oraConnDc.Query(strSql)
            if len(rtnCntDc) == 0:
                self.log.PrintWarningLog("CUACCT_CLS_FEE_SN 柜台映射表 JZ30.TCL_CLS_FEE 中未设置任何值，暂时跳过本步骤！")
            else:
                for orgItem in rtnCntDc:
                    ''' 根据 ACC_CLS 来判断字典中是否存在相关值'''

                    fieldValue = {}
                    fieldValue['DD_ID'] = "CUACCT_CLS_FEE_SN"
                    fieldValue['DD_ITEM'] = orgItem[0]
                    fieldValue['INT_ORG'] = self.info["org_code"]

                    rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)
                    if rtnDates[0] == 0:
                        ''' 不存在则直接增加 '''
                        fieldValue['DD_ITEM_NAME'] = orgItem[1]
                        rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                        if rtnMsg == True:
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                            self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                        else:
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                            self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                    else:
                        ''' 存在还需要判断 DD_ITEM_NAME 值是否一致，不一致则按柜台的修改'''
                        fieldValue['DD_ITEM_NAME'] = orgItem[1]
                        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

                        if rtnDates[0] != 0:
                            ''' 完全一致，不做任何修改 '''
                            MSG_INFO["MSG_NO"] = 120004
                            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                        else:
                            ''' 字典名称不一致，按柜台的修改 '''
                            # 定义需要修改的字段列表
                            setFieldList = ["DD_ITEM_NAME"]
                            rtnMsg = self.Assembling_Update_Sql(tableName, fieldValue, setFieldList)
                            if rtnMsg[0] == True :
                                MSG_INFO["MSG_NO"] = 120005
                                MSG_INFO["MSG_STR"] = "{0} 表中条件为 {2} 已有 {3} 的记录，但数据结果与柜台不一致,使用UPDATE 修改为 {1}！".format(tableName, rtnMsg[1], rtnMsg[2], rtnMsg[3])
                                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                            else:
                                MSG_INFO["MSG_NO"] = 120105
                                MSG_INFO["MSG_STR"] = "{0} 表中使用UPDATE 条件为 {2} 设置 {1} 的记录失败！数据库返回消息为：{3}".format(tableName, rtnMsg[1], rtnMsg[2], rtnMsg[0] )
                                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        elif ddId == "CUACCT_GRP" or ddId == "FISL_CUACCT_GRP" or ddId == "OPT_CUACCT_GRP":
            # 资产账户组别 CUACCT_GRP FISL_CUACCT_GRP OPT_CUACCT_GRP
            fieldValue = {}
            fieldValue['DD_ID'] = ddId
            fieldValue['DD_ITEM'] = '0'
            fieldValue['INT_ORG'] = self.info["org_code"]
            fieldValue['DD_ITEM_NAME'] = '普通组别'

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 120001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        elif ddId == "CUACCT_LVL" or ddId == "FISL_CUACCT_LVL" or ddId == "OPT_CUACCT_LVL":
            fieldValue = {}
            fieldValue['DD_ID'] = ddId
            fieldValue['DD_ITEM'] = '0'
            fieldValue['INT_ORG'] = self.info["org_code"]
            fieldValue['DD_ITEM_NAME'] = '普通级别'

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 120001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        elif ddId == "FILINGCABINET_NO":
            fieldValue = {}
            fieldValue['DD_ID'] = ddId
            fieldValue['DD_ITEM'] = '*'
            fieldValue['INT_ORG'] = self.info["org_code"]
            fieldValue['DD_ITEM_NAME'] = '*'

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 120001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        elif ddId == "SZACCT_DCL_ID":

            fieldValue = {}
            fieldValue['DD_ID'] = ddId
            fieldValue['INT_ORG'] = self.info["org_code"]

            fieldValue['DD_ITEM'] = '00'
            fieldValue['DD_ITEM_NAME'] = self.info["sza_ic"]

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 120001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            fieldValue['DD_ITEM'] = '20'
            fieldValue['DD_ITEM_NAME'] = self.info["sza_ic"]

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 120001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))


            fieldValue['DD_ITEM'] = '10'
            fieldValue['DD_ITEM_NAME'] = self.info["sse_code"]

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 120001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            fieldValue['DD_ITEM'] = '11'
            fieldValue['DD_ITEM_NAME'] = self.info["sse_code"]

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 120001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            MSG_INFO["MSG_NO"] = 120125
            MSG_INFO["MSG_STR"] = "增加的字典项 {0} 不在许可范围内，请检查相关参数！".format(ddId)
            self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_OPENTMPL_CFG(self, tableName, openName):

        # 取出最大模板编号 然后往下依次顺延
        strSql = "SELECT MAX(OPENTMPL_CFG) FROM OPENTMPL_CFG"
        opentpmMaxSn = self.oraConn.Query(strSql)[0][0] + 1

        if openName == "个人":
            USER_TYPE = "0"
        elif openName == "机构":
            USER_TYPE = "1"
        elif openName == "产品":
            USER_TYPE = "2"

        MSG_INFO = self.Create_Msg()
        fieldValue = {}
        fieldValue['INT_ORG'] = self.info["org_code"]
        fieldValue['OPENTMPL_NAME'] = openName

        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 110001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            fieldValue['OPENTMPL_CFG'] = opentpmMaxSn
            fieldValue['CUST_TYPE'] = "0"
            fieldValue['CUST_CLS'] = "0"
            fieldValue['CHANNELS'] = "0238"
            fieldValue['CRITERION'] = "0"
            fieldValue['RISK_FACTOR'] = "0"
            fieldValue['USER_TYPE'] = USER_TYPE
            fieldValue['ZIP_CODE'] = self.info["post_code"]
            fieldValue['CUACCT_ATTR'] = "0"
            fieldValue['CUACCT_CLS'] = "0"
            fieldValue['CUACCT_LVL'] = "0"
            fieldValue['CUACCT_GRP'] = "0"
            fieldValue['CUST_AGMT_TYPES'] = " "
            fieldValue['CUACCT_CLS_FEE_SN'] = "0"
            fieldValue['OPEN_SOURCE'] = "0"
            fieldValue['CUST_GRP'] = "0"
            fieldValue['CUACCT_LIMIT'] = " "

            rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_SERIAL(self, tableName, seqName):
        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        fieldValue['ORG_CODE'] = self.info["org_code"]
        fieldValue['SERIAL_ID'] = seqName

        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 110001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            if seqName == "SEQ_CUACCT":

                fieldValue['SERIAL_TYPE'] = "0"  # 原先使用A 会从数据库中获取序列，在实际中会产生问题，现在改用0 从表中获取序列自增值。
                fieldValue['MIN_VAL_INT64'] = "1"
                fieldValue['MAX_VAL_INT64'] = "89999999"
                fieldValue['LAST_VAL_INT64'] = "0"
                fieldValue['CYCLE_FLAG'] = 0
                fieldValue['BIZ_DATE'] = self.info["oper_date"]
                fieldValue['PHYSICAL_DATE'] = self.info["oper_date"]
                fieldValue['REMARK'] = "资产账户产生序号"
            elif seqName == "SEQ_CUACCT_BIZTYPE_2":
                fieldValue['SERIAL_TYPE'] = "0"  # 原先使用A 会从数据库中获取序列，在实际中会产生问题，现在改用0 从表中获取序列自增值。
                fieldValue['MIN_VAL_INT64'] = "99000000"
                fieldValue['MAX_VAL_INT64'] = "99999999"
                fieldValue['LAST_VAL_INT64'] = "99000000"
                fieldValue['CYCLE_FLAG'] = 0
                fieldValue['BIZ_DATE'] = self.info["oper_date"]
                fieldValue['PHYSICAL_DATE'] = self.info["oper_date"]
                fieldValue['REMARK'] = "融资融券资产账户"
            elif seqName == "SEQ_CUACCT_BIZTYPE_3":
                fieldValue['SERIAL_TYPE'] = "0"  # 原先使用A 会从数据库中获取序列，在实际中会产生问题，现在改用0 从表中获取序列自增值。
                fieldValue['MIN_VAL_INT64'] = "98000000"
                fieldValue['MAX_VAL_INT64'] = "98999999"
                fieldValue['LAST_VAL_INT64'] = "98000000"
                fieldValue['CYCLE_FLAG'] = 0
                fieldValue['BIZ_DATE'] = self.info["oper_date"]
                fieldValue['PHYSICAL_DATE'] = self.info["oper_date"]
                fieldValue['REMARK'] = "股票期权"
            elif seqName == "SEQ_CUACCT_BIZTYPE_4":
                fieldValue['SERIAL_TYPE'] = "0"  # 原先使用A 会从数据库中获取序列，在实际中会产生问题，现在改用0 从表中获取序列自增值。
                fieldValue['MIN_VAL_INT64'] = "96000000"
                fieldValue['MAX_VAL_INT64'] = "97999999"
                fieldValue['LAST_VAL_INT64'] = "96000000"
                fieldValue['CYCLE_FLAG'] = 0
                fieldValue['BIZ_DATE'] = self.info["oper_date"]
                fieldValue['PHYSICAL_DATE'] = self.info["oper_date"]
                fieldValue['REMARK'] = "OTC理财资金账户"

            rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_STK_ACCTBIZ_ORG(self, tableName, STKEX, ACCTBIZ_AGTCODE):
        # 以18营业部为模板生成新数据
        strSql = "SELECT INT_ORG,STKEX,ACCTBIZ_CODE,ACCTBIZ_AGTCODE FROM STK_ACCTBIZ_ORG WHERE STKEX='%s' AND ACCTBIZ_AGTCODE='%s' AND INT_ORG=18 ORDER BY ACCTBIZ_CODE" % (
        STKEX, ACCTBIZ_AGTCODE)
        rtnDatas = self.oraConn.Query(strSql)

        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        for rtnData in rtnDatas:
            fieldValue['INT_ORG'] = self.info["org_code"]
            fieldValue['STKEX'] = rtnData[1]
            fieldValue['ACCTBIZ_CODE'] = rtnData[2]
            fieldValue['ACCTBIZ_AGTCODE'] = rtnData[3]

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 110001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_STK_ACCTBIZ_AGENT_NEW(self, tableName):

        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        fieldValue['ACCTBIZ_AGTORG'] = "100042"
        if len(self.info["org_code"]) == 2:
            fieldValue['ACCTBIZ_AGTCODE'] =  "{0}00{1}".format(fieldValue['ACCTBIZ_AGTORG'], self.info["org_code"])
        else:
            fieldValue['ACCTBIZ_AGTCODE'] = "{0}0{1}".format(fieldValue['ACCTBIZ_AGTORG'], self.info["org_code"])

        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 110001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:

            fieldValue['ACCTBIZ_AGTNAME'] = self.info["org_name"]
            fieldValue['QUEUE'] = "KCXPXA_ACCTBIZ"

            rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
            if rtnMsg == True :
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_STK_ACCTBIZ_CFG_NEW(self, tableName):
        # 以18营业部为模板生成新数据
        strSql = '''
            SELECT INT_ORG,
                   ACCTBIZ_CODE,
                   ACCTBIZ_NAME,
                   ACCTBIZ_EXCODE,
                   TIMESLICES,
                   USER_TYPE,
                   ACCT_TYPE,
                   CURRENCY,
                   FEE_AMT_EX,
                   FEE_AMT,
                   EXCL_ORGS,
                   IMG_CLSES,
                   ACCT_OPENTYPE,
                   BGN_STIME,
                   END_STIME,
                   FIRMID
              FROM STK_ACCTBIZ_CFG_NEW
             WHERE INT_ORG = '18'
        '''
        rtnDatas = self.oraConn.Query(strSql)
        for rtnData in rtnDatas:
            MSG_INFO = self.Create_Msg()
            fieldValue = {}
            fieldValue['INT_ORG'] = self.info["org_code"]
            fieldValue['ACCTBIZ_CODE'] = rtnData[1]
            # fieldValue['ACCTBIZ_NAME'] =
            # fieldValue['ACCTBIZ_EXCODE'] =
            # fieldValue['TIMESLICES'] =
            # fieldValue['USER_TYPE'] =
            # fieldValue['ACCT_TYPE'] =
            # fieldValue['CURRENCY'] =
            # fieldValue['FEE_AMT_EX'] =
            # fieldValue['FEE_AMT'] =
            # fieldValue['EXCL_ORGS'] =
            # fieldValue['IMG_CLSES'] =
            fieldValue['ACCT_OPENTYPE'] = rtnData[12]
            # fieldValue['BGN_STIME'] =
            # fieldValue['END_STIME'] =
            # fieldValue['FIRMID'] =

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 110001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                # fieldValue['INT_ORG'] = self.info["org_code"]
                # fieldValue['ACCTBIZ_CODE'] = rtnData[1]
                fieldValue['ACCTBIZ_NAME'] = rtnData[2]
                fieldValue['ACCTBIZ_EXCODE'] = rtnData[3]
                fieldValue['TIMESLICES'] = rtnData[4]
                fieldValue['USER_TYPE'] = rtnData[5]
                fieldValue['ACCT_TYPE'] = rtnData[6]
                fieldValue['CURRENCY'] = rtnData[7]
                fieldValue['FEE_AMT_EX'] = rtnData[8]
                fieldValue['FEE_AMT'] = rtnData[9]
                fieldValue['EXCL_ORGS'] = rtnData[10]
                fieldValue['IMG_CLSES'] = rtnData[11]
                # fieldValue['ACCT_OPENTYPE'] = rtnData[12]
                fieldValue['BGN_STIME'] = rtnData[13]
                fieldValue['END_STIME'] = rtnData[14]
                fieldValue['FIRMID'] = rtnData[15]

                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_STK_ACCTBIZ_ORG_NEW(self,tableName):

        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        ACCTBIZ_AGTORG = "100042"
        if len(self.info["org_code"]) == 2:
            fieldValue['ACCTBIZ_AGTCODE'] =  "{0}00{1}".format(ACCTBIZ_AGTORG, self.info["org_code"])
        else:
            fieldValue['ACCTBIZ_AGTCODE'] = "{0}0{1}".format(ACCTBIZ_AGTORG, self.info["org_code"])

        strSql = "SELECT INT_ORG, ACCTBIZ_CODE, ACCTBIZ_AGTCODE FROM STK_ACCTBIZ_ORG_NEW WHERE INT_ORG = '18'"
        rtnDatas = self.oraConn.Query(strSql)

        for rtnData in rtnDatas:
            fieldValue['INT_ORG'] = self.info["org_code"]
            fieldValue['ACCTBIZ_CODE'] = rtnData[1]

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 110001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:

                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_XY_ORG(self, tableName):

        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        ACCTBIZ_AGTORG = "GYZQ000"
        if len(self.info["org_code"]) == 2:
            fieldValue['XY_ORG_CODE'] =  "{0}00{1}".format(ACCTBIZ_AGTORG, self.info["org_code"])
        else:
            fieldValue['XY_ORG_CODE'] = "{0}0{1}".format(ACCTBIZ_AGTORG, self.info["org_code"])

        fieldValue['ORG_CODE'] = self.info["org_code"]

        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 110001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            fieldValue['REMARK'] = "CH后台脚本增加_{0}".format(self.info["oper_date"] )
            rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_IMG_STORE_CFG(self, tableName):

        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        fieldValue['INT_ORG'] = self.info["org_code"]
        fieldValue['REPOSITORY_ID'] = 'IMG_REPOSITORY1'
        fieldValue['IMG_CLS'] = '@@@'

        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 110001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_STK_PBU_ORG(self, tableName, STKEX, STKBD, STKPBU, MAJPBU_FLAG):

        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        fieldValue['INT_ORG'] = self.info["org_code"]
        fieldValue['STKEX'] = STKEX
        fieldValue['STKBD'] = STKBD
        fieldValue['STKPBU'] = STKPBU
        fieldValue['MAJPBU_FLAG'] = MAJPBU_FLAG

        rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 110001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_GENERATE_RULE(self, tableName):

        MSG_INFO = self.Create_Msg()
        fieldValue = {}

        if len(self.info["org_code"]) == 2:
            fieldValue['ACCT_LEN'] = 10
        else:
            fieldValue['ACCT_LEN'] = 11

        fieldValue['ORG_CODE'] = self.info["org_code"]

        strSql = "SELECT GENERATE_TYPE, ORG_CODE, PREFIX, ACCT_LEN, CUACCT_USES FROM GENERATE_RULE WHERE ORG_CODE = '18'"
        rtnDatas = self.oraConn.Query(strSql)
        for rtnData in rtnDatas:
            fieldValue['GENERATE_TYPE'] = rtnData[0]
            fieldValue['PREFIX'] = self.info["org_code"]
            fieldValue['CUACCT_USES'] = rtnData[4]

            rtnDates = self.Table_Row_Is_Exist(tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 110001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:

                rtnMsg = self.Assembling_Insert_Sql(tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))


class YGT_Add_Org(object):

    def __init__(self, ginsengDict, oraConn, mySqlConn, log):
        self.info = ginsengDict
        self.oraConn = oraConn
        self.mySqlConn = mySqlConn
        self.log = log
        # self.MSG_INFO = {}
        # self.MSG_INFO["MSG_NO"] = 0
        # self.MSG_INFO["MSG_STR"] = "初始消息空间"

    def Rtn_Exist_ParOrg(self):
        ''' 母营业部信息判断 '''
        MSG_INFO = Create_Msg()

        strSql = '''
            select org_name,par_org
              from UEM_ORG_INFO
             where org_type = 0
               and org_code = %s
        ''' % (self.info["central_org"])
        rtnDatas = self.oraConn.Query(strSql)  # 只会存在一条记录，故 只返回第一个数组

        if len(rtnDatas) == 1 :
            MSG_INFO["MSG_RTN"] = True
            MSG_INFO["MSG_CONTENT"] = rtnDatas[0]
            return MSG_INFO
        else :
            MSG_INFO["MSG_RTN"] = False
            MSG_INFO["MSG_NO"] = 200142
            MSG_INFO["MSG_CONTENT"]=""
            MSG_INFO["MSG_STR"] = "UEM_ORG_INFO结果表中无返回结果或返回了多条信息，脚本无法继续执行"
            return (MSG_INFO)

    def Get_Mzx_AreaCode(self):
        ''' 获取并返回最大的分支区域代码 '''
        MSG_INFO = Create_Msg()
        strSql = '''
            SELECT MAX(ORG_CODE)
              FROM UEM_ORG_INFO
             WHERE ORG_TYPE = 0
               AND ORG_CLS = '01'
               AND ORG_CODE LIKE '15%'
        '''
        rtnDatas = self.oraConn.Query(strSql)  # 只会存在一条记录，故 只返回第一个数组

        if len(rtnDatas) == 1 :
            MSG_INFO["MSG_RTN"] = True
            MSG_INFO["MSG_CONTENT"] = int(rtnDatas[0][0]) + 1
            MSG_INFO["MSG_STR"] = "已获取最大行政区域编码为 %s" % MSG_INFO["MSG_CONTENT"]
            return MSG_INFO
        else :
            MSG_INFO["MSG_RTN"] = False
            MSG_INFO["MSG_NO"] = 200142
            MSG_INFO["MSG_CONTENT"]=""
            MSG_INFO["MSG_STR"] = "UEM_ORG_INFO结果表中无返回结果或返回了多条信息，脚本无法继续执行"
            return (MSG_INFO)

    def Insert_AreaCode_Row(self, tableName, maxAreaCode, cenOrgName):
        ''' 生成一条新的区域（片区，分公司）记录 '''
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['ORG_CODE'] = maxAreaCode
        fieldValue['ORG_TYPE'] = '0'
        fieldValue['ORG_CLS'] = '01'

        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 210241
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            fieldValue['ORG_NAME'] = "%sA-C机构" % cenOrgName
            fieldValue['ORG_FULL_NAME'] = "%sA-C机构" % cenOrgName
            fieldValue['ORG_STATUS'] = '0'
            fieldValue['PAR_ORG'] = '999'
            fieldValue['ORG_LVL'] = ' '
            fieldValue['ACCT_LEN'] = ' '
            fieldValue['ACCT_PREFIX'] = ' '
            fieldValue['AREA_NO'] = '0551'
            fieldValue['ZIP_CODE'] = '230001'
            fieldValue['AREA_ADDR'] = ' '
            fieldValue['ORG_TEL'] = ' '
            fieldValue['NIGHT_MARKET'] = ' '
            fieldValue['LEGAL_ID'] = ' '
            fieldValue['REMARK'] = 'CH_脚本新增_%s' % self.info["oper_date"]
            fieldValue['IS_COMMON'] = '0'
            fieldValue['EMAIL'] = ' '
            fieldValue['FAX'] = ' '
            fieldValue['LINKMAN'] = ' '
            fieldValue['FOREIGN_CPTL_FLAG'] = '0'
            fieldValue['BIZ_AREA'] = '00'
            fieldValue['DISTRICT'] = '00'
            fieldValue['CFM_FLAG'] = '0'
            fieldValue['IS_SEPARATE'] = '0'

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_New_OrgInfo_2_UEM_ORG_INFO(self, tableName, tyzhInfo, maxAreaCode):
        ''' 新的营业部增加函数 营业部相关信息从账户系统中获取 '''
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['ORG_CODE'] = tyzhInfo["ORG_CODE"]
        fieldValue['ORG_TYPE'] = tyzhInfo["ORG_TYPE"]
        fieldValue['ORG_CLS'] = tyzhInfo["ORG_CLS"]

        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 210251
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:
            fieldValue['ORG_NAME'] = tyzhInfo["ORG_NAME"]
            fieldValue['ORG_FULL_NAME'] = tyzhInfo["ORG_FULL_NAME"]
            fieldValue['ORG_STATUS'] = tyzhInfo["ORG_STATUS"]
            fieldValue['PAR_ORG'] = maxAreaCode
            fieldValue['ORG_LVL'] = tyzhInfo["ORG_LVL"]
            fieldValue['ACCT_LEN'] = tyzhInfo["ACCT_LEN"]
            fieldValue['ACCT_PREFIX'] = tyzhInfo["ACCT_PREFIX"]
            fieldValue['AREA_NO'] = tyzhInfo["AREA_NO"]
            fieldValue['ZIP_CODE'] = tyzhInfo["ZIP_CODE"]
            fieldValue['AREA_ADDR'] = tyzhInfo["AREA_ADDR"]
            fieldValue['ORG_TEL'] = tyzhInfo["ORG_TEL"]
            fieldValue['NIGHT_MARKET'] = tyzhInfo["NIGHT_MARKET"]
            fieldValue['LEGAL_ID'] = tyzhInfo["LEGAL_ID"]
            fieldValue['REMARK'] = 'CH_脚本新增_%s' % self.info["oper_date"]
            fieldValue['IS_COMMON'] = " "
            fieldValue['EMAIL'] = " "
            fieldValue['FAX'] = " "
            fieldValue['LINKMAN'] = " "
            fieldValue['FOREIGN_CPTL_FLAG'] = " "
            fieldValue['BIZ_AREA'] = " "
            fieldValue['DISTRICT'] = " "
            fieldValue['CFM_FLAG'] = " "
            fieldValue['IS_SEPARATE'] = " "

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_PostPermission_For_NewOrg(self, tableName, postId, orgCode):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        fieldValue['POST_ID'] = postId
        fieldValue['PERMISSION_CLS'] = '0'
        fieldValue['PERMISSION_CLS_TYPE'] = '0'
        fieldValue['GRANT_TYPE'] = '1'
        fieldValue['PERMISSION_CODE'] = orgCode

        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 210351
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

        else:

            fieldValue['REMARK'] =  'CH_脚本新增_%s' % self.info["oper_date"]
            fieldValue['VALID_DATE'] = '30001231'

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))


class WZH_Add_Org(object):
    def __init__(self, ginsengDict, oraConn, mySqlConn, log):
        self.info = ginsengDict
        self.oraConn = oraConn
        self.mySqlConn = mySqlConn
        self.log = log
        # self.MSG_INFO = {}
        # self.MSG_INFO["MSG_NO"] = 0
        # self.MSG_INFO["MSG_STR"] = "初始消息空间"

    def Insert_EI_EAMS_CBPS_PTL_VER_ITEM(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        # 使用18营业部为模板 取配置替换插入
        strSql = "SELECT * FROM {0} WHERE PROP_VALUE = '18'".format(tableName)
        rtnDatas = self.oraConn.QureyDict(strSql)

        for data in rtnDatas :

            fieldValue['PV_ID'] = data['PV_ID']
            fieldValue['PROTOCOL_PROP'] = data['PROTOCOL_PROP']
            fieldValue['PROP_VALUE'] = self.info["org_code"]

            rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 310351
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:

                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EI_EAMS_CBPS_CODE_NOTE(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        fieldValue['CODE_VAL'] = int(self.info["org_code"])
        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 310451
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:

            # 取最大 code_id
            strSql = "SELECT MAX(CODE_ID) FROM EI_EAMS.CBPS_CODE_NOTE "
            rtnMax = self.oraConn.Query(strSql)[0][0]
            maxCodeId = int(rtnMax) + 1

            fieldValue['CODE_ID'] = maxCodeId
            fieldValue['GROUP_KEY'] = "DEPT_TYPE"
            fieldValue['CODE_NOTE'] = self.info["org_name"]
            fieldValue['PARENT_CODE_ID'] = ''
            fieldValue['IS_SYS_PARAM'] = ''

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_CI_CUSTDB_DEP_RIGHT(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        # 使用18营业部为模板 取配置替换插入
        strSql = "SELECT * FROM {0} WHERE RIGHT_DEP_CODE = '18'".format(tableName)
        rtnDatas = self.oraConn.QureyDict(strSql)

        for data in rtnDatas:

            if data["DEP_CODE"] != "999":
                fieldValue['DEP_CODE'] = self.info["org_code"]
                fieldValue['DEP_NAME'] = self.info["org_fname"]
            else:
                fieldValue['DEP_CODE'] = data["DEP_CODE"]
                fieldValue['DEP_NAME'] = data["DEP_NAME"]

            fieldValue['RIGHT_DEP_CODE'] = self.info["org_code"]
            fieldValue['RIGHT_DEP_NAME'] = self.info["org_fname"]

            rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 310451
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:

                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_CI_CUSTDB_DEPARTMENT(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['DEP_CODE'] = self.info["org_code"]

        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 310551
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:

            strSql = ''' SELECT MAX(DEP_ID) FROM CI_CUSTDB.DEPARTMENT '''
            maxDepId = int(self.oraConn.Query(strSql)[0][0]) + 1

            fieldValue['DEP_ID'] = maxDepId
            fieldValue['DEP_NAME'] = self.info["org_fname"]
            fieldValue['ADDR'] = self.info["address"]
            fieldValue['LINKMAN'] = ""
            fieldValue['TEL'] = self.info["tel"]
            fieldValue['POST'] = self.info["post_code"]
            fieldValue['EMAIL'] = ""
            fieldValue['DEP_TYPE'] = "4"
            fieldValue['PARENT_DEP_ID'] = "1000"
            fieldValue['DEP_STATUS'] = "0"
            fieldValue['NOTE'] = ""
            fieldValue['DEP_ORDER'] = ""
            fieldValue['REGION_ID'] = "A1"
            fieldValue['KHWDDM'] = ""

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))


class ESIM_Add_Org(object):
    def __init__(self, ginsengDict, oraConn, mySqlConn, log):
        self.info = ginsengDict
        self.oraConn = oraConn
        self.mySqlConn = mySqlConn
        self.log = log

    def Insert_ES_SYSTEM_DEPARTMENT(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        fieldValue['DEP_CODE'] = self.info["xy_org"]

        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            strSql = "SELECT DEP_ID FROM ES_SYSTEM.DEPARTMENT WHERE DEP_CODE='{0}'".format(self.info["xy_org"])
            depId = self.oraConn.Query(strSql)[0][0]
            MSG_INFO["MSG_NO"] = 400000
            MSG_INFO["MSG_CONTENT"] = depId
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            return MSG_INFO
        else:
            seqVal = Get_SEQUENCES_NEXTVAL(self.oraConn, "ES_SYSTEM.S_DEPARTMENT")
            fieldValue['DEP_ID'] = seqVal
            fieldValue['DEP_NAME'] = self.info["org_name"]
            fieldValue['DEP_FULL_NAME'] = self.info["org_fname"]
            fieldValue['ADDR'] = self.info["address"]
            fieldValue['LINKMAN'] = ""
            fieldValue['TEL'] = self.info["tel"]
            fieldValue['POST'] = self.info["post_code"]
            fieldValue['EMAIL'] = ""
            fieldValue['DEP_TYPE'] = "4"
            fieldValue['PARENT_DEP_ID'] = "1000"
            fieldValue['DEP_STATUS'] = "0"
            fieldValue['NOTE'] = ""
            fieldValue['DEP_ORDER'] = ""

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_NO"] = 400000
                MSG_INFO["MSG_CONTENT"] = seqVal
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            return MSG_INFO

    def Insert_ES_SYSTEM_DEP_ROLE_RELA(self, tableName, ROLE_ID):

        MSG_INFO = Create_Msg()
        fieldValue = {}

        fieldValue['DEP_ID'] = self.info["dep_id"]
        fieldValue['ROLE_ID'] =  ROLE_ID

        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 410051
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_ES_SYSTEM_USER_ROLE(self,tableName, ROLE_NAME):
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['DEP_ID'] = self.info["dep_id"]
        fieldValue['ROLE_NAME'] = ROLE_NAME

        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)
        if rtnDates[0] != 0:
            strSql = "SELECT ROLE_ID FROM ES_SYSTEM.USER_ROLE WHERE 0=0 AND ROLE_NAME='{0}' AND DEP_ID='{1}'".format(ROLE_NAME, self.info["dep_id"])
            roleId = self.oraConn.Query(strSql)[0][0]
            MSG_INFO["MSG_NO"] = 410000
            MSG_INFO["MSG_CONTENT"] = roleId
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            return MSG_INFO
        else:
            seqVal = Get_SEQUENCES_NEXTVAL(self.oraConn, "ES_SYSTEM.S_USER_ROLE")
            fieldValue['ROLE_ID'] = seqVal
            fieldValue['NOTE'] = ""
            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_NO"] = 410000
                MSG_INFO["MSG_CONTENT"] = seqVal
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            return MSG_INFO

    def Insert_ES_SYSTEM_USER_ROLE_RIGHT(self, tableName, roleName, roleId):
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['ROLE_ID'] = roleId

        tempDepCode = "1072"  # 以10上海东方路营业部的权限为模板
        strSql = '''
            SELECT ROLE_ID,APP_ID,MENU_CODE
              FROM ES_SYSTEM.USER_ROLE_RIGHT
             WHERE ROLE_ID IN (SELECT ROLE_ID
                                 FROM ES_SYSTEM.USER_ROLE
                                WHERE DEP_ID = '%s'
                                  AND ROLE_NAME = '%s')
        ''' % (tempDepCode, roleName)
        rtnDatas = self.oraConn.QureyDict(strSql)

        for data in rtnDatas:
            fieldValue['APP_ID'] = data["APP_ID"]
            fieldValue['MENU_CODE'] = data["MENU_CODE"]

            rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)
            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 410001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_NO"] = 410002
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EA_PUB_SYS_SETTLE_DEPT(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        fieldValue['SETTLE_DEPT_CODE'] = self.info["xy_org"]
        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 410005
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:
            fieldValue['SETTLE_DEPT_NAME'] = "{0}{1}".format(self.info["org_code"],self.info["org_name"])
            fieldValue['SETTLE_ENTITY_ID'] = "1"
            fieldValue['SETTLE_DEPT_TYPE'] = "01"
            fieldValue['SETTLE_STORE_TYPE'] = "3"
            fieldValue['SETTLE_DEPT_STATUS'] = "0"
            fieldValue['HELP_CODE'] = self.info["org_code"]
            fieldValue['ORDER_CODE'] = ""
            fieldValue['CUST_DEPT_CODE'] = ""
            fieldValue['SETTLE_DEPT_FULLNAME'] = self.info["org_fname"]

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_NO"] = 410006
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EA_PUB_SYS_CUST_DEPT(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}
        if len(self.info["org_code"]) == 2:
            orgCode = "00"
        else:
            orgCode = "0"
        fieldValue['CUST_DEPT_CODE'] = "{0}{1}".format(orgCode, self.info["org_code"])
        fieldValue['SETTLE_DEPT_CODE'] = self.info["xy_org"]
        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 410011
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:
            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_NO"] = 410012
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EA_DATAREP_SYS_CSRC_CODE(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['SETTLE_DEPT_CODE'] = self.info["xy_org"]
        fieldValue['CSRC_CODE'] = self.info["sfc_code"]
        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 410021
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:
            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_NO"] = 410022
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EA_PUB_BR_CONTRACT(self, tableName, mktCode):
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['MKT_CODE'] = mktCode
        fieldValue['SETTLE_DEPT_CODE'] = self.info["xy_org"]
        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 410031
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:

            fieldValue['BR_CONTRACT_ID'] = Get_SEQUENCES_NEXTVAL(self.oraConn, "EA_PUB.S_BR_CONTRACT")
            fieldValue['SUB_DEPT_CODE'] = ''
            fieldValue['CLEAR_TYPE'] = '0'
            fieldValue['CONT_FLAG'] = '1'
            fieldValue['CONT_CODE'] = ''

            if mktCode == "01":
                fieldValue['SEAT_CODE'] = self.info["sha_unit"]
                fieldValue['CONT_BEG_BIT'] = "1"
                fieldValue['CONT_LEN'] = "10"
                fieldValue['BEGIN_VALUE'] = "{0}{1}".format(self.info["sha_ic"], self.info["sha_trd_interval"].split("～")[0])
                fieldValue['END_VALUE'] = "{0}{1}".format(self.info["sha_ic"], self.info["sha_trd_interval"].split("～")[1])
            elif mktCode == "02":
                fieldValue['SEAT_CODE'] = self.info["sza_unit"]
                fieldValue['CONT_BEG_BIT'] = "1"
                fieldValue['CONT_LEN'] = "8"
                fieldValue['BEGIN_VALUE'] = self.info["sza_trd_interval"].split("～")[0]
                fieldValue['END_VALUE'] = self.info["sza_trd_interval"].split("～")[1]
            elif mktCode == "03":
                fieldValue['SEAT_CODE'] = "90008"
                fieldValue['CONT_BEG_BIT'] = "3"
                fieldValue['CONT_LEN'] = "8"
                fieldValue['BEGIN_VALUE'] = self.info["shb_trd_interval"].split("～")[0]
                fieldValue['END_VALUE'] = self.info["shb_trd_interval"].split("～")[1]
            elif mktCode == "04":
                fieldValue['SEAT_CODE'] = "260200"
                fieldValue['CONT_BEG_BIT'] = "1"
                fieldValue['CONT_LEN'] = "8"
                fieldValue['BEGIN_VALUE'] = self.info["szb_trd_interval"].split("～")[0]
                fieldValue['END_VALUE'] = self.info["szb_trd_interval"].split("～")[1]
            elif mktCode == "13":
                fieldValue['SEAT_CODE'] = "722000"
                fieldValue['CONT_BEG_BIT'] = "1"
                fieldValue['CONT_LEN'] = "8"
                fieldValue['BEGIN_VALUE'] = self.info["sta_trd_interval"].split("～")[0]
                fieldValue['END_VALUE'] = self.info["sta_trd_interval"].split("～")[1]

            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
            if rtnMsg == True:
                MSG_INFO["MSG_NO"] = 410032
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EA_PUB_RI_DEP_RIGHT(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}
        fieldValue['DEP_ID'] = self.info["dep_id"]
        rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

        if rtnDates[0] != 0:
            MSG_INFO["MSG_NO"] = 401001
            MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
            self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
        else:
            fieldValue['BUSI_RIGHT_TYPE'] = '01'
            fieldValue['RIGHT_CODE1'] = self.info["xy_org"]
            fieldValue['RIGHT_CODE2'] = ""
            rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)

            if rtnMsg == True:
                MSG_INFO["MSG_NO"] = 401000
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:
                MSG_INFO["MSG_NO"] = 401999
                MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EA_PUB_RI_USER_ROLE_RIGHT(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        strSql = "SELECT ROLE_ID FROM ES_SYSTEM.USER_ROLE WHERE DEP_ID = '%s'" % self.info["dep_id"]
        rtnDatas = self.oraConn.Query(strSql)

        for data in rtnDatas:
            fieldValue['USER_ROLE_ID'] = data[0]
            fieldValue['RIGHT_CODE1'] = self.info["xy_org"]
            fieldValue['BUSI_RIGHT_TYPE'] = "01"

            rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 402001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:

                # 空字段放在条件查询中不能返回记录，该字段放在后面赋值
                fieldValue['RIGHT_CODE2'] = ""
                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_NO"] = 402000
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_NO"] = 402999
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_EA_DEPACCT_DEPT_ACC(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        quarterFlag = self.info["oper_date"][4:6]
        yyyy = self.info["oper_date"][0:4]

        SETTLE_DEPT_CODE = "GYZQ000130"  # 以130营业部的权限为模板 该营业部较新 科目参考性更强
        strSql = '''SELECT DEPT_ACC_ID,ACC_BOOK_ID,ACCT_CODE,SETTLE_DEPT_CODE,INIT_DATE FROM EA_DEPACCT.DEPT_ACC WHERE SETTLE_DEPT_CODE='%s' ''' % SETTLE_DEPT_CODE
        rtnDatas = self.oraConn.QureyDict(strSql)

        for data in rtnDatas:
            strSql = '''SELECT DEPT_ACC_ID FROM EA_DEPACCT.DEPT_ACC WHERE SETTLE_DEPT_CODE='%s' AND ACC_BOOK_ID='%s' AND ACCT_CODE='%s' ''' % (
                self.info["xy_org"], data["ACC_BOOK_ID"], data["ACCT_CODE"])
            rtnSubDatas = self.oraConn.Query(strSql)

            if len(rtnSubDatas) != 0:
                fieldValue['DEPT_ACC_ID'] = rtnSubDatas[0][0]

            from datetime import datetime
            yearInitDay = "%s0101" % datetime.now().strftime("%Y")

            quarterInitDay = []
            if quarterFlag in ["01", "02", "03"]:
                quarterInitDay.append("{}0101".format(yyyy))
            elif quarterFlag in ["04", "05", "06"]:
                quarterInitDay.append("{}0101".format(yyyy))
                quarterInitDay.append("{}0401".format(yyyy))
            elif quarterFlag in ["07", "08", "09"]:
                quarterInitDay.append("{}0101".format(yyyy))
                quarterInitDay.append("{}0401".format(yyyy))
                quarterInitDay.append("{}0701".format(yyyy))
            elif quarterFlag in ["10", "11", "12"]:
                quarterInitDay.append("{}0101".format(yyyy))
                quarterInitDay.append("{}0401".format(yyyy))
                quarterInitDay.append("{}0701".format(yyyy))
                quarterInitDay.append("{}1001".format(yyyy))

            if len(rtnSubDatas) == 0:

                fieldValue['DEPT_ACC_ID'] = Get_SEQUENCES_NEXTVAL(self.oraConn, "EA_DEPACCT.S_DEPT_ACC")

                fieldValue['ACC_BOOK_ID'] = data["ACC_BOOK_ID"]
                fieldValue['ACCT_CODE'] = data["ACCT_CODE"]
                fieldValue['SETTLE_DEPT_CODE'] = self.info["xy_org"]
                fieldValue['INIT_DATE'] = yearInitDay

                # 空字段放在条件查询中不能返回记录，该字段放在后面赋值
                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_NO"] = 403000
                    MSG_INFO["MSG_STR"] = "{0} 表中新增 SETTLE_DEPT_CODE='{1}' ACC_BOOK_ID='{2}' ACCT_CODE='{3}'的记录成功！".format(tableName, self.info["xy_org"], data["ACC_BOOK_ID"], data["ACCT_CODE"])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_NO"] = 403999
                    MSG_INFO["MSG_STR"] = "{0} 表中新增 SETTLE_DEPT_CODE='{1}' ACC_BOOK_ID='{2}' ACCT_CODE='{3}' 的记录失败！数据库返回消息为：{4}".format(tableName, self.info["xy_org"], data["ACC_BOOK_ID"], data["ACCT_CODE"], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                for quarterDay in quarterInitDay:

                    FUND_BALANCE = {}
                    FUND_BALANCE['DEPT_ACC_ID'] = fieldValue['DEPT_ACC_ID']
                    FUND_BALANCE['SETTLE_DATE'] = quarterDay
                    FUND_BALANCE['FUND_BAL'] = 0
                    rtnDates = Table_Row_Is_Exist(self.oraConn, "EA_DEPACCT.FUND_BALANCE", FUND_BALANCE)

                    if rtnDates[0] != 0:
                        MSG_INFO["MSG_NO"] = 404001
                        MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                        self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                    else:

                        # 空字段放在条件查询中不能返回记录，该字段放在后面赋值
                        rtnMsg = Assembling_Insert_Sql(self.oraConn, "EA_DEPACCT.FUND_BALANCE", FUND_BALANCE)
                        if rtnMsg == True:
                            MSG_INFO["MSG_NO"] = 404000
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format("EA_DEPACCT.FUND_BALANCE", rtnDates[1])
                            self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                        else:
                            MSG_INFO["MSG_NO"] = 404999
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format("EA_DEPACCT.FUND_BALANCE", rtnDates[1], rtnMsg)
                            self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

            else:
                MSG_INFO["MSG_NO"] = 403001
                MSG_INFO["MSG_STR"] = "{0} 表里已有 SETTLE_DEPT_CODE='{1}' ACC_BOOK_ID='{2}' ACCT_CODE='{3}' 的记录，忽略本次处理！".format(tableName, self.info["xy_org"], data["ACC_BOOK_ID"], data["ACCT_CODE"])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

                for quarterDay in quarterInitDay:

                    FUND_BALANCE = {}
                    FUND_BALANCE['DEPT_ACC_ID'] = fieldValue['DEPT_ACC_ID']
                    FUND_BALANCE['SETTLE_DATE'] = quarterDay
                    FUND_BALANCE['FUND_BAL'] = 0
                    rtnDates = Table_Row_Is_Exist(self.oraConn, "EA_DEPACCT.FUND_BALANCE", FUND_BALANCE)

                    if rtnDates[0] != 0:
                        MSG_INFO["MSG_NO"] = 405001
                        MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format("EA_DEPACCT.FUND_BALANCE", rtnDates[1])
                        self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                    else:

                        # 空字段放在条件查询中不能返回记录，该字段放在后面赋值
                        rtnMsg = Assembling_Insert_Sql(self.oraConn, "EA_DEPACCT.FUND_BALANCE", FUND_BALANCE)
                        if rtnMsg == True:
                            MSG_INFO["MSG_NO"] = 405000
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format("EA_DEPACCT.FUND_BALANCE", rtnDates[1])
                            self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                        else:
                            MSG_INFO["MSG_NO"] = 405999
                            MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format("EA_DEPACCT.FUND_BALANCE", rtnDates[1], rtnMsg)
                            self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_UI_FI_K3_ACCT_COMP(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        orgCode3 = self.info["xy_org"].replace("GYZQ000","")

        # 以18营业部为模板获取相关配置信息
        strSql = '''
            SELECT ACCT_COMP_ID,
                   ACC_BOOK_ID,
                   SETTLE_DEPT_CODE,
                   ACCT_CODE,
                   ACCOUNT_CODE,
                   ACCT_ID,
                   EXCER,
                   FIN_TYPE,
                   OPP_ACCT_ID,
                   ACCT_COMP_TYPE,
                   VOU_SORT_ID,
                   BANK_CODE
              FROM UI_FI.K3_ACCT_COMP
             WHERE SETTLE_DEPT_CODE = 'GYZQ000018'
        '''
        rtnDatas = self.oraConn.QureyDict(strSql)

        for data in rtnDatas:

            fieldValue['SETTLE_DEPT_CODE'] = self.info["xy_org"]
            fieldValue['ACCT_CODE'] = data['ACCT_CODE']

            rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 402001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:

                if data["OPP_ACCT_ID"] == None:
                    fieldValue['OPP_ACCT_ID'] = ""
                else:
                    OPP_ACCT_ID_L = data["OPP_ACCT_ID"].split(".")
                    fieldValue["OPP_ACCT_ID"] = "%s.%s.%s" % (OPP_ACCT_ID_L[0], OPP_ACCT_ID_L[1], orgCode3)

                if data['BANK_CODE'] == None:
                    fieldValue['BANK_CODE'] = ""
                else:
                    fieldValue['BANK_CODE'] = data['BANK_CODE']

                fieldValue['ACCOUNT_CODE'] = "{0}{1}".format(data['ACCOUNT_CODE'][:-3], orgCode3)
                fieldValue['ACCT_ID'] = "{0}{1}".format(data['ACCT_ID'][:-3], orgCode3)
                fieldValue['EXCER'] = self.info["org_name"]
                fieldValue['ACCT_COMP_ID'] = Get_SEQUENCES_NEXTVAL(self.oraConn, "UI_FI.S_ACCT_COMP_ID")
                fieldValue['ACC_BOOK_ID'] = data['ACC_BOOK_ID']
                fieldValue['FIN_TYPE'] = data['FIN_TYPE']
                fieldValue['ACCT_COMP_TYPE'] = data['ACCT_COMP_TYPE']
                fieldValue['VOU_SORT_ID'] = data['VOU_SORT_ID']

                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_NO"] = 402999
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_UI_FI_K3_ACCT_COMP_AUX(self, tableName):
        MSG_INFO = Create_Msg()
        fieldValue = {}

        orgCode3 = self.info["xy_org"].replace("GYZQ000","")

        strSql = '''
            SELECT A.ACCT_COMP_ID,
                   '1' AS AUX_ORDER,
                   '类别' AS AUX_ITEM,
                   '01' AS AUX_VALUE,
                   '客户资金' AS AUX_NAME,
                   'NOR' AS ACCOUNT_FIED,
                   '' AS TA_CODE
              FROM UI_FI.K3_ACCT_COMP A
             WHERE 1 = 1
                  --此处为新增营业部编码
               AND A.SETTLE_DEPT_CODE = '%s'
            UNION ALL
            SELECT A.ACCT_COMP_ID,
                   '1' AS AUX_ORDER,
                   '类别' AS AUX_ITEM,
                   '01' AS AUX_VALUE,
                   '客户资金' AS AUX_NAME,
                   'OPP' AS ACCOUNT_FIED,
                   '' AS TA_CODE
              FROM UI_FI.K3_ACCT_COMP A
             WHERE 1 = 1
               AND A.SETTLE_DEPT_CODE = '%s'
               AND SUBSTR(A.OPP_ACCT_ID, 1, 8) = '2113.15.'
        ''' % (self.info["xy_org"] , self.info["xy_org"] )

        rtnDatas = self.oraConn.QureyDict(strSql)

        for data in rtnDatas:

            fieldValue['ACCT_COMP_ID'] = data["ACCT_COMP_ID"]

            rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 409001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:

                if data["TA_CODE"] == None:
                    fieldValue['TA_CODE'] = ""
                else:
                    fieldValue['TA_CODE'] = data["TA_CODE"]

                fieldValue['AUX_ORDER'] = data["AUX_ORDER"]
                fieldValue['AUX_ITEM'] = data["AUX_ITEM"]
                fieldValue['AUX_VALUE'] = data["AUX_VALUE"]
                fieldValue['AUX_NAME'] = data["AUX_NAME"]
                fieldValue['ACCOUNT_FIED'] = data["ACCOUNT_FIED"]

                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_NO"] = 402999
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

    def Insert_UI_FI_JD_KDK3_ACCT_CFG(self, tableName):

        MSG_INFO = Create_Msg()
        fieldValue = {}

        orgCode3 = self.info["xy_org"].replace("GYZQ000","")


        strSql = '''
            SELECT A.DEPT_ACC_ID,
                   SUBSTR(FI_ACCT_CODE, 1, 8) || '%s' AS FI_ACCT_CODE,
                   A.KD_ACCT_PROP,
                   '%s' AS FEXP,
                   A.FCLSNAME1,
                   A.FOBJID1,
                   A.FOBJNAME1,
                   A.FCLSNAME2,
                   A.FOBJID2,
                   A.FOBJNAME2,
                   A.FCLSNAME3,
                   A.FOBJID3,
                   A.FOBJNAME3,
                   A.FCLSNAME4,
                   A.FOBJID4,
                   A.FOBJNAME4,
                   A.FCLSNAME5,
                   A.FOBJID5,
                   A.FOBJNAME5,
                   A.FCLSNAME6,
                   A.FOBJID6,
                   A.FOBJNAME6,
                   A.FCLSNAME7,
                   A.FOBJID7,
                   A.FOBJNAME7,
                   A.FCLSNAME8,
                   A.FOBJID8,
                   A.FOBJNAME8,
                   B.ACCT_CODE,
                   '%s' AS SETTLE_DEPT_CODE,
                   B.ACC_BOOK_ID
              FROM UI_FI.JD_KDK3_ACCT_CFG A
              LEFT JOIN EA_DEPACCT.VW_DEPT_ACC_INFO B
                ON A.DEPT_ACC_ID = B.DEPT_ACC_ID
            -- 该处改为模板营业部编号
             WHERE B.SETTLE_DEPT_CODE = 'GYZQ000018'
               AND (B.ACCT_CODE LIKE '2113%%')
        ''' % (orgCode3, self.info["org_name"], self.info["xy_org"] )
        rtnSubDatas = self.oraConn.QureyDict(strSql)

        for data in rtnSubDatas:

            for k, v in data.items() :
                if v == None :
                    data[k] = ""

            strSql = "SELECT DEPT_ACC_ID FROM EA_DEPACCT.VW_DEPT_ACC_INFO WHERE ACCT_CODE = '%s' AND SETTLE_DEPT_CODE = '%s' AND ACC_BOOK_ID = '%s'" % (
                data["ACCT_CODE"], data["SETTLE_DEPT_CODE"], data["ACC_BOOK_ID"])

            fieldValue['DEPT_ACC_ID'] = self.oraConn.Query(strSql)[0][0]
            fieldValue['FEXP'] = data['FEXP']

            rtnDates = Table_Row_Is_Exist(self.oraConn, tableName, fieldValue)

            if rtnDates[0] != 0:
                MSG_INFO["MSG_NO"] = 409001
                MSG_INFO["MSG_STR"] = "{0} 表里已有{1}的记录，忽略本次处理！".format(tableName, rtnDates[1])
                self.log.PrintWarningLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
            else:

                fieldValue['FI_ACCT_CODE'] = data['FI_ACCT_CODE']
                fieldValue['KD_ACCT_PROP'] = data['KD_ACCT_PROP']
                fieldValue['FCLSNAME1'] = data['FCLSNAME1']
                fieldValue['FOBJID1'] = data['FCLSNAME2']
                fieldValue['FOBJNAME1'] = data['FOBJNAME1']
                fieldValue['FCLSNAME2'] = data['FCLSNAME2']
                fieldValue['FOBJID2'] = data['FOBJID2']
                fieldValue['FOBJNAME2'] = data['FOBJNAME2']
                fieldValue['FCLSNAME3'] = data['FCLSNAME3']
                fieldValue['FOBJID3'] = data['FOBJID3']
                fieldValue['FOBJNAME3'] = data['FOBJNAME3']
                fieldValue['FCLSNAME4'] = data['FCLSNAME4']
                fieldValue['FOBJID4'] = data['FOBJID4']
                fieldValue['FOBJNAME4'] = data['FOBJNAME4']
                fieldValue['FCLSNAME5'] = data['FCLSNAME5']
                fieldValue['FOBJID5'] = data['FOBJID5']
                fieldValue['FOBJNAME5'] = data['FOBJNAME5']
                fieldValue['FCLSNAME6'] = data['FCLSNAME6']
                fieldValue['FOBJID6'] = data['FOBJID6']
                fieldValue['FOBJNAME6'] = data['FOBJNAME6']
                fieldValue['FCLSNAME7'] = data['FCLSNAME7']
                fieldValue['FOBJID7'] = data['FOBJID7']
                fieldValue['FOBJNAME7'] = data['FOBJNAME7']
                fieldValue['FCLSNAME8'] = data['FCLSNAME8']
                fieldValue['FOBJID8'] = data['FOBJID8']
                fieldValue['FOBJNAME8'] = data['FOBJNAME8']

                rtnMsg = Assembling_Insert_Sql(self.oraConn, tableName, fieldValue)
                if rtnMsg == True:
                    MSG_INFO["MSG_NO"] = 402999
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录成功！".format(tableName, rtnDates[1])
                    self.log.PrintDebugLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))
                else:
                    MSG_INFO["MSG_STR"] = "{0} 表中新增{1}的记录失败！数据库返回消息为：{2}".format(tableName, rtnDates[1], rtnMsg)
                    self.log.PrintErrorLog("{0}:{1}".format(MSG_INFO["MSG_NO"], MSG_INFO["MSG_STR"]))

