from django.test import TestCase

# Create your tests here.



paras = '''
    task_name = models.CharField(max_length=128, verbose_name="任务名称")
    host_ip = models.GenericIPAddressField(verbose_name="主机IP")
    os_type = models.CharField(max_length=2, choices=GetSysDict("OS_TYPE"),verbose_name="系统类型")
    os_user = models.CharField(max_length=32, verbose_name=u"系统用户名")
    os_user_passwd = models.CharField(max_length=128, verbose_name="系统用户密码")
    db_type = models.CharField(max_length=8, choices=GetSysDict("DB_TYPE"), null=True, verbose_name="数据库类型", default="ORACLE")
    db_sid = models.CharField(max_length=16, verbose_name="数据库SID")
    db_user = models.CharField(max_length=16, verbose_name="数据库用户")
    db_user_passwd = models.CharField(max_length=32, verbose_name="数据库用户密码")
    is_compre = models.CharField(max_length=1, choices=GetSysDict("IS_COMPRE"), verbose_name="是否压缩", default="Y")
    compre_type = models.CharField(max_length=8, choices=GetSysDict("COMPRE_TYPE"), verbose_name="压缩方式", default="RAR")
    is_compre_passwd = models.CharField(max_length=32, choices=GetSysDict("IS_COMPRE_PASSED"),verbose_name="是否加密压缩", default="Y")
    file_save_path = models.CharField(max_length=255, verbose_name="本地保存路径")
    arch_nas_user = models.CharField(max_length=32, verbose_name="NAS归档用户名")
    arch_nas_passwd = models.CharField(max_length=128, verbose_name="NAS归档密码")
    arch_nas_path = models.CharField(max_length=255, verbose_name="NAS归档路径")
    names_of_backdb = models.CharField(max_length=512, verbose_name="备份库列表")
    reserved_day = models.IntegerField(verbose_name="本地备份文件保留天数")
    proc_flag = models.CharField(max_length=1, choices=GetSysDict("PROC_FLAG"), verbose_name="处理标识", default="Y")
    task_run_time = models.TimeField(verbose_name="任务执行时间")
    enforce_flag = models.CharField(max_length=4, choices=GetSysDict("PROC_FLAG"), verbose_name="强制处理标识", default="N")

'''

lineStr = ""
for x in paras.splitlines():
    paraArr = x.split("=")
    if paraArr[0]:
        print(paraArr[0].replace(" ",""))
        lineStr = "'%s,'%s'" %  (lineStr, paraArr[0].replace(" ",""))
print(lineStr)