from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime

from .GetSysInfo import GetSysDict

# Create your models here.


# class UserProfile(AbstractUser):
#     # 添加自定义字段
#     user_id = models.IntegerField(default=0,verbose_name=u"用户编码")
#     # dept_id = models.IntegerField(default=0, verbose_name=u"机构或部门编码")
#     role_id = models.CharField(max_length=11, verbose_name=u"权限组", default="")
#     sex = models.CharField(
#         max_length=8,
#         choices=(
#             ("male",u"男"),
#             ("female",u"女")
#         ),
#         verbose_name=u"性别",
#         default="男"
#     )
#     # dept_id_rights = models.CharField(max_length=1024, verbose_name=u"机构访问权限", default="")
#     # oper_control = models.CharField(max_length=32, verbose_name=u"特殊操作权限", default="")
#
#     # Meta 信息，即后台栏目名
#     class Meta:
#         verbose_name = u"用户信息"
#         verbose_name_plural = verbose_name
#
#     # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
#     def __str__(self):
#         return self.username
#
#
# class DeptInfo(models.Model):
#     dept_id = models.IntegerField(default=0, primary_key=True, verbose_name=u"机构或部门编码")
#     dept_parent = models.CharField(max_length=8, verbose_name=u"上级机构", default="")
#     dept_type = models.CharField(max_length=2, verbose_name=u"机构类型", default="")
#     dept_name = models.CharField(max_length=128, verbose_name=u"机构名称", default="")
#     status = models.CharField(max_length=1, verbose_name=u"机构状态", default="")
#     remark = models.CharField(max_length=1024, verbose_name=u"备注信息", default="")
#
#     # Meta 信息，即后台栏目名
#     class Meta:
#         verbose_name = u"机构信息"
#         verbose_name_plural = verbose_name
#
#     def __str__(self):
#         return self.dept_name
#
#
