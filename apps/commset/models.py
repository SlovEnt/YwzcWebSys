from django.db import models
from datetime import datetime

from django.contrib.auth.models import AbstractUser, Group, Permission

# Create your models here.

from DjangoUeditor.models import UEditorField
from .GetSysInfo import GetSysDict

class UserProfile(AbstractUser):
    # 添加自定义字段
    user_id = models.IntegerField(default=0,verbose_name=u"用户编码")
    # dept_id = models.IntegerField(default=0, verbose_name=u"机构或部门编码")
    role_id = models.CharField(max_length=11, verbose_name=u"权限组", default="")
    sex = models.CharField(max_length=8, choices=GetSysDict("SEX"), verbose_name=u"性别", default="3")
    # dept_id_rights = models.CharField(max_length=1024, verbose_name=u"机构访问权限", default="")
    # oper_control = models.CharField(max_length=32, verbose_name=u"特殊操作权限", default="")

    # Meta 信息，即后台栏目名
    class Meta:
        verbose_name = u"用户信息"
        verbose_name_plural = verbose_name

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return self.username


class SysDictName(models.Model):
    dict_name = models.CharField(max_length=128, null=True, verbose_name="字典名称")
    dict_en_name = models.CharField(max_length=16, null=True, verbose_name="字典简码")
    dict_cls = models.CharField(max_length=1, choices=GetSysDict("MODEL_CLS"), verbose_name=u"字典类别", default="0")
    dict_proc_flag = models.CharField(max_length=4, choices=GetSysDict("OPER_TYPE"), null=True, verbose_name="处理标识", default="3")

    class Meta:
        verbose_name = u"系统字典"
        verbose_name_plural = verbose_name
        ordering = ('dict_name',)

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return self.dict_name


class SysDictItem(models.Model):
    dict_name = models.ForeignKey(SysDictName, on_delete=models.CASCADE, verbose_name="字典名称")
    dict_item = models.CharField(max_length=64, verbose_name="字典标识")
    dict_item_name = models.CharField(max_length=128, verbose_name="标识名称")
    org_id = models.CharField(max_length=4, default="0000", verbose_name="机构编码")
    remark = models.TextField(null=True, blank=True, verbose_name="备注信息")

    class Meta:
        verbose_name = u"系统字典类别"
        verbose_name_plural = verbose_name
        # unique_together = (('dict_name', 'dict_item', 'dict_item_name'),)
        ordering = ('dict_name', 'dict_item', 'dict_item_name')

    def __str__(self):
        return '字典名称：{0} (字典项标识：{1}, 字典项名称：{2})'.format(self.dict_name,self.dict_item,self.dict_item_name)


class SysParam(models.Model):
    param_en_name = models.CharField(max_length=32, verbose_name="参数简码")
    param_name = models.CharField(max_length=128, verbose_name="参数名称")
    param_value = models.TextField(verbose_name=u"参数值")
    param_type = models.CharField(max_length=8, choices=GetSysDict("OPER_TYPE"), verbose_name=u"参数操作标识", default="3")
    param_cls = models.CharField(max_length=2, choices=GetSysDict("MODEL_CLS"), verbose_name="参数分类", default="1")
    param_status = models.CharField(max_length=1, choices=GetSysDict("PROC_FLAG"), null=True, verbose_name="处理标识", default="Y")

    class Meta:
        verbose_name = u"系统参数"
        verbose_name_plural = verbose_name
        ordering = ('param_name',)

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return self.param_name


class Calendar(models.Model):
    ''' 交易日历表 '''
    bookset = models.CharField(max_length=1, verbose_name="关联模块名称")
    physical_date = models.CharField(max_length=8, verbose_name=" 物理日期")
    date_flag = models.CharField(max_length=1, choices=GetSysDict("DATE_FLAG"), verbose_name="日期标志") # DD[209]：'0' -- 非清算日，'1' -- 清算日"
    date_status = models.CharField(max_length=1, verbose_name="日期状态") #DD[210]：'0' -- 关账，'1' -- 开账

    class Meta:
        verbose_name = "交易日历"
        verbose_name_plural = verbose_name
        ordering = ('physical_date',)
        unique_together = ('bookset', 'physical_date',)
        index_together = ('physical_date', 'date_flag',)

    def __str__(self):
        return self.physical_date


class MenuList(models.Model):
    '''{'title': '函数运行状态', 'url': self.get_model_url(RunScriptsList, 'changelist'), 'icon': self.get_model_icon(RunScriptsList)},'''
    titleA = models.CharField(max_length=64, choices=GetSysDict("MODEL_CLS"), verbose_name="一级菜单名称")
    title = models.CharField(max_length=64, verbose_name="二级菜单名称")
    url = models.CharField(max_length=128, verbose_name="链接目标")
    icon = models.CharField(max_length=128, verbose_name="图标链接")
    sort_rule = models.IntegerField(verbose_name="排序规则")
    flag = models.CharField(max_length=1, choices=GetSysDict("PROC_FLAG"), null=True, verbose_name="处理标识", default="Y")

    class Meta:
        verbose_name = "菜单设置"
        verbose_name_plural = verbose_name
        ordering = ('sort_rule',)
        unique_together = ('url',)

    def __str__(self):
        return self.title
