
import os
import sys

def Get_ConfigInfo(Config):
    # 取数据库连接信息 敏感信息 放入文本配置中
    '''
    [MySql Config]
    DB_HOST =
    DB_PORT =
    USER_NAME =
    USER_PWD =
    DB_NAME =

    globalsConfigFile = r"./YwzcMGET/Config.ini"
    globParaInfo = Get_ConfigInfo(globalsConfigFile)

    '''

    if "Config" not in dir():
        raise Exception("100015 错误，全局参数配置文件没有设值")
    if os.path.isfile(Config) == False:
        raise Exception("100016 错误，全局参数配置文件不存在")
    paramInfo = {}
    for line in open(Config,"r",encoding= 'UTF-8'):
        if line != "\n" :
            info = line.strip("\n")
            # 首字符为 # ; 等符号 视为注释
            if info.strip()[0] != "#" and info.strip()[0] != ";" and info.strip()[0] != "[" :
                # print(info.strip()[0])
                info = info.split("=")
                if len(info) == 2:
                    paramName = info[0].strip()
                    paramValue = info[1].strip()
                    paramInfo[paramName]=paramValue
    return paramInfo


def Password_Gen_MD5Str(strPassword):
    # 用户密码加密函数 MD5 非逆向加密函数 无需保密自身
    import hashlib
    if isinstance(strPassword,(str)) == True :
        m = hashlib.md5(strPassword.encode(encoding='utf-8'))
        encryPasswordStr = "pwd_md5$%s" % m.hexdigest()
        return encryPasswordStr
    else:
        return ''


