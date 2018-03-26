import os

from SEDefFuncPack import torndb
from django.conf import settings

mySqlConn = torndb.Connection(
    "%s:%s" % (settings.DB_HOST, settings.DB_PORT),
    settings.DB_NAME,
    settings.USER_NAME,
    settings.USER_PWD,
)

def GetSysDict(dictId):

    ''' 返回Django Models里使用的系统字典明细 '''
    strSql = '''
        SELECT
            a.dict_en_name,
            b.dict_item,
            b.dict_item_name
        FROM
            commset_sysdictname a
        INNER JOIN commset_sysdictitem b ON a.id = b.dict_name_id
         WHERE a.dict_en_name = '%s'
    ''' % (dictId)
    rtnDatas = mySqlConn.query(strSql)
    dict = {}
    for x in rtnDatas:
        dict[x["dict_item"]] = x["dict_item_name"]
    sysDictItem = tuple(sorted(tuple(dict.items())))
    return sysDictItem

# sysDictItem = GetSysDict("SEX")
# print(sysDictItem)



