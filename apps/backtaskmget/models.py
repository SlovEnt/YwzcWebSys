from django.db import models
import datetime
# Create your models here.
from commset.GetSysInfo import GetSysDict


class DBBackTaskSet(models.Model):
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

    class Meta:
        verbose_name = u"数据库备份任务"
        verbose_name_plural = verbose_name
        ordering = ('task_name',)

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return self.task_name


class DBBackTaskLog(models.Model):
    task_name = models.CharField(max_length=128, verbose_name="任务名称")
    task_run_date = models.DateField(verbose_name="任务执行日期")
    task_run_time = models.TimeField(verbose_name="任务执行时间")
    host_ip = models.GenericIPAddressField(verbose_name="主机IP")
    db_type = models.CharField(max_length=8, choices=GetSysDict("DB_TYPE"), verbose_name="数据库类型", default="ORACLE")
    names_of_backdb = models.CharField(max_length=512, verbose_name="备份库列表")
    file_name = models.FileField(verbose_name="归档文件名")
    compre_type = models.CharField(max_length=8, choices=GetSysDict("COMPRE_TYPE"), verbose_name="压缩方式", default="RAR")
    file_save_path = models.CharField(max_length=255, verbose_name="原始路径")
    arch_nas_path = models.CharField(max_length=255, verbose_name="归档路径")
    compre_passwd = models.CharField(max_length=32, verbose_name="压缩密码")
    file_siz = models.IntegerField(verbose_name="文件大小（kb）")
    md5_string = models.CharField(max_length=64, verbose_name="MD5校验码")
    remark = models.TextField(verbose_name="备注信息")

    class Meta:
        verbose_name = u"数据库备份日志"
        verbose_name_plural = verbose_name
        ordering = ('task_name','task_run_date','task_run_time')


class FileBackTaskSet(models.Model):
    task_name = models.CharField(max_length=128, verbose_name="任务名称")
    host_ip = models.GenericIPAddressField(verbose_name="主机IP")
    host_user = models.CharField(max_length=32, verbose_name=u"系统用户名")
    host_user_passwd = models.CharField(max_length=128, verbose_name="用户密码")
    file_save_path = models.CharField(max_length=255, verbose_name="文件原始路径")
    arch_nas_user = models.CharField(max_length=32, verbose_name=u"归档路径用户名")
    arch_nas_passwd = models.CharField(max_length=128, verbose_name="归档路径密码")
    arch_nas_path = models.CharField(max_length=255, verbose_name="归档路径")
    reserved_day = models.IntegerField(verbose_name="备份切转天数")
    proc_flag = models.CharField(max_length=1, choices=GetSysDict("PROC_FLAG"), verbose_name="处理标识", default="Y")
    task_run_time = models.TimeField(verbose_name="任务执行时间")

    class Meta:
        verbose_name = u"文件备份任务"
        verbose_name_plural = verbose_name
        ordering = ('task_name',)

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return self.task_name


class FileBackTaskExcludeSet(models.Model):
    task_name = models.ForeignKey(FileBackTaskSet, on_delete=models.CASCADE, verbose_name="任务名称")
    exclude_list = models.CharField(max_length=256, verbose_name="排除名单")
    proc_flag = models.CharField(max_length=1, choices=GetSysDict("PROC_FLAG"), verbose_name="处理标识", default="Y")

    class Meta:
        verbose_name = u"文件备份排除列表"
        verbose_name_plural = verbose_name
        # ordering = ('task_name','exclude_list',)

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return self.exclude_list


from django.utils.html import format_html
class FileBackTaskLog(models.Model):
    task_name = models.CharField(max_length=128, verbose_name="任务名称")
    task_status = models.CharField(max_length=1, choices=GetSysDict("TASK_STATUS"), verbose_name="任务状态")
    task_run_date = models.DateField(verbose_name="任务执行日期")
    task_run_time = models.TimeField(verbose_name="任务执行时间")
    host_ip = models.GenericIPAddressField(verbose_name="主机IP")
    file_modify_dt = models.DateTimeField(verbose_name="文件修改时间")
    md5_string = models.CharField(max_length=64, verbose_name="MD5校验码")
    file_name = models.CharField(max_length=100,verbose_name="文件名")
    file_save_path = models.CharField(max_length=256, verbose_name="原始路径")
    arch_nas_path = models.CharField(max_length=256, verbose_name="归档路径")
    file_siz = models.IntegerField(verbose_name="文件大小（kb）")
    remark = models.TextField(verbose_name="备注信息")

    def colored_task_status(self):
        if self.task_status == "3":
            color_code = "red"
            task_status = "失败"
        elif self.task_status == "2":
            color_code = "green"
            task_status = "忽略"
        elif self.task_status == "1":
            color_code = "blue"
            task_status = "完成"
        else:
            color_code = "green"
            task_status = "处理中'"
        return format_html(
            '<span style="color: {};">{}</span>',
            color_code,
            task_status,
        )
    colored_task_status.short_description = "任务处理结果"


    class Meta:
        verbose_name = u"文件备份日志"
        verbose_name_plural = verbose_name
        ordering = ('task_run_date','task_run_time')

    def __str__(self):
        return self.task_name
