import os
from commset.Config import Get_ConfigInfo

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

globalsConfigFile = BASE_DIR + r"\commset\Config.ini"
globParaInfo = Get_ConfigInfo(globalsConfigFile)

from SEDefFuncPack import torndb

mySqlConn = torndb.Connection(
    "%s:%s" % (globParaInfo["DB_HOST"], globParaInfo["DB_PORT"]),
    globParaInfo["DB_NAME"],
    globParaInfo["USER_NAME"],
    globParaInfo["USER_PWD"],
)


def GetSysDict(dictId):

    strSql = '''
        SELECT
            dict_id,
            dict_item,
            dict_item_name
        FROM
            CommonSet_sys_dict_item WHERE dict_id = '%s'
    ''' % (dictId)

    rtnDatas = mySqlConn.query(strSql)

    dict = {}
    for x in rtnDatas:
        dict[x["dict_item"]] = x["dict_item_name"]

    sysDictItem = tuple(sorted(tuple(dict.items())))

    return sysDictItem

# sysDictItem = GetSysDict(mySqlConn, "para_type")
# print(sysDictItem)


# def GetSysPara(paraId):
#     strSql = '''
#         SELECT
#             dict_id,
#             dict_item,
#             dict_item_name
#         FROM
#             CommonSet_sys_dict_item WHERE dict_id = '%s'
#     ''' % (paraId)
#
#     rtnDatas = mySqlConn.query(strSql)
#
#     para = {}
#     for x in rtnDatas:
#         dict[x["dict_item"]] = x["dict_item_name"]
#
#     sysDictItem = tuple(sorted(tuple(dict.items())))
#
#     return sysDictItem
