
import xadmin
from django.contrib.auth.models import Group, Permission
from xadmin.plugins.auth import UserAdmin, Group
from xadmin.models import Log

# 和X admin的view绑定
from xadmin import views
from .models import UserProfile, SysDictName, SysDictItem


# x admin 全局配置参数信息设置
# class GlobalSettings(object):
#     site_title = "业务支持综合管理系统"
#     site_footer = "SlovEnt 提供技术支持"
#     # 收起菜单
#     menu_style = "accordion"
#
# # 将头部与脚部信息进行注册:
# xadmin.site.register(views.CommAdminView, GlobalSettings)


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


class GlobalSetting(object):

    site_title = "业务支持综合管理系统"
    site_footer = "SlovEnt 提供技术支持"
    menu_style = "accordion"

    def get_site_menu(self):
        return (
            {'title': '系统管理', 'menus': (
                {'title': '用户信息', 'url': self.get_model_url(UserProfile, 'changelist')},
                {'title': '用户分组', 'url': self.get_model_url(Group, 'changelist')},
                {'title': '用户权限', 'url': self.get_model_url(Permission, 'changelist')},
                {'title': '系统字典', 'url': self.get_model_url(SysDictName, 'changelist')},
                {'title': '字典类别', 'url': self.get_model_url(SysDictItem, 'changelist')},
                {'title': '日志记录', 'url': self.get_model_url(Log, 'changelist')},
            )},
        )

xadmin.site.register(views.CommAdminView, GlobalSetting)
