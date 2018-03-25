
import xadmin
from django.contrib.auth.models import Group, Permission
from xadmin.plugins.auth import UserAdmin, Group
from xadmin.models import Log

# 和X admin的view绑定
from xadmin import views
from .models import SysDictName, SysDictItem


# x admin 全局配置参数信息设置
class GlobalSettings(object):
    site_title = "业务支持综合管理系统"
    site_footer = "SlovEnt 提供技术支持"
    # 收起菜单
    menu_style = "accordion"

# 将头部与脚部信息进行注册:
xadmin.site.register(views.CommAdminView, GlobalSettings)


# 系统字典
class SysDictInline(object):
    model = SysDictItem
    extra = 0

class SysDictNameAdmin(object):
    list_display = ['dict_name', 'dict_en_name', 'dict_type', 'dict_proc_flag']
    search_fields = ['dict_name', 'dict_en_name', 'dict_type', 'dict_proc_flag']
    list_filter = ['dict_name', 'dict_en_name', 'dict_type', 'dict_proc_flag']
    ordering = ["-dict_name"]
    readonly_fields = ["dict_proc_flag"]
    inlines = [SysDictInline]
    refresh_times = [3, 5]

xadmin.site.register(SysDictName, SysDictNameAdmin)

class SysDictItemAdmin(object):
    list_display = ['dict_name', 'dict_item', 'dict_item_name']
    search_fields = ['dict_name', 'dict_item', 'dict_item_name']
    list_filter = ['dict_name', 'dict_item', 'dict_item_name']
    readonly_fields = ["org_id"]

xadmin.site.register(SysDictItem, SysDictItemAdmin)

