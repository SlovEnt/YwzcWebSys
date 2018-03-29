from django.test import TestCase

# Create your tests here.



paras = '''
    task_name = models.CharField(max_length=128, verbose_name="任务名称")
    task_run_date = models.DateField(verbose_name="任务执行日期")
    task_run_time = models.TimeField(verbose_name="任务执行时间")
    host_ip = models.GenericIPAddressField(verbose_name="主机IP")
    file_modify_dt = models.DateTimeField(verbose_name="文件修改时间")
    md5_string = models.CharField(max_length=64, verbose_name="MD5校验码")
    file_name = models.FileField(verbose_name="文件名")
    file_save_path = models.CharField(max_length=255, verbose_name="原始路径")
    arch_nas_path = models.CharField(max_length=255, verbose_name="归档路径")
    file_siz = models.IntegerField(verbose_name="文件大小（kb）")
    remark = models.TextField(verbose_name="备注信息")
'''

lineStr = ""
for x in paras.splitlines():
    paraArr = x.split("=")
    print(paraArr[0].replace(" ",""))
    lineStr = "'%s,'%s'" %  (lineStr, paraArr[0].replace(" ",""))
print(lineStr)