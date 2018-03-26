
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
    model_icon = 'fa fa-cog'

xadmin.site.register(SysDictName, SysDictNameAdmin)

class SysDictItemAdmin(object):
    list_display = ['dict_name', 'dict_item', 'dict_item_name']
    search_fields = ['dict_name', 'dict_item', 'dict_item_name']
    list_filter = ['dict_name', 'dict_item', 'dict_item_name']
    readonly_fields = ["org_id"]
    model_icon = 'fa fa-cog'

# xadmin.site.register(SysDictItem, SysDictItemAdmin)


from apps.netmget.models import Net2Manage, Net5Manage, Net9Manage, Net10Manage, Net12Manage, Net16Manage, Net91Manage, Test168NetManage, Test169NetManage, Test170NetManage, Test171NetManage
from apps.backtaskmget.models import DBBackTaskSet,DBBackTaskLog

class GlobalSetting(object):

    site_title = "业务支持综合管理系统"
    site_footer = "SlovEnt 提供技术支持"
    menu_style = "accordion"

    def get_site_menu(self):
        return (
            {'title': '系统管理', 'icon': 'fa fa-cogs','menus': (
                {'title': '用户信息', 'url': self.get_model_url(UserProfile, 'changelist'),'icon':self.get_model_icon(UserProfile)},
                {'title': '用户分组', 'url': self.get_model_url(Group, 'changelist'),'icon':self.get_model_icon(Group)},
                {'title': '用户权限', 'url': self.get_model_url(Permission, 'changelist'),'icon':self.get_model_icon(Permission)},
                {'title': '系统字典', 'url': self.get_model_url(SysDictName, 'changelist'),'icon':self.get_model_icon(SysDictName)},
                # {'title': '字典类别', 'url': self.get_model_url(SysDictItem, 'changelist'),'icon':self.get_model_icon(SysDictItem)},
                {'title': '日志记录', 'url': self.get_model_url(Log, 'changelist'),'icon':self.get_model_icon(Log)},
            )},
            {'title': 'IP地址管理', 'icon': 'fa fa-sitemap','menus': (
                {'title': '10.0.2.0', 'url': self.get_model_url(Net2Manage, 'changelist'),'icon':self.get_model_icon(Net2Manage)},
                {'title': '10.0.5.0', 'url': self.get_model_url(Net5Manage, 'changelist'),'icon':self.get_model_icon(Net5Manage)},
                {'title': '10.0.9.0', 'url': self.get_model_url(Net9Manage, 'changelist'),'icon':self.get_model_icon(Net9Manage)},
                {'title': '10.0.10.0', 'url': self.get_model_url(Net10Manage, 'changelist'),'icon':self.get_model_icon(Net10Manage)},
                {'title': '10.0.12.0', 'url': self.get_model_url(Net12Manage, 'changelist'),'icon':self.get_model_icon(Net12Manage)},
                {'title': '10.0.16.64', 'url': self.get_model_url(Net16Manage, 'changelist'),'icon':self.get_model_icon(Net16Manage)},
                {'title': '10.0.91.0', 'url': self.get_model_url(Net91Manage, 'changelist'),'icon':self.get_model_icon(Net91Manage)},
                {'title': '192.168.168.0', 'url': self.get_model_url(Test168NetManage, 'changelist'),'icon':self.get_model_icon(Test168NetManage)},
                {'title': '192.168.169.0', 'url': self.get_model_url(Test169NetManage, 'changelist'),'icon':self.get_model_icon(Test169NetManage)},
                {'title': '192.168.170.0', 'url': self.get_model_url(Test170NetManage, 'changelist'),'icon':self.get_model_icon(Test170NetManage)},
                {'title': '192.168.171.0', 'url': self.get_model_url(Test171NetManage, 'changelist'),'icon':self.get_model_icon(Test171NetManage)},
            )},
            {'title': '备份任务管理', 'icon': 'fa fa-tasks', 'menus': (
                {'title': '数据库备份任务', 'url': self.get_model_url(DBBackTaskSet, 'changelist'), 'icon': self.get_model_icon(DBBackTaskSet)},
                {'title': '数据库备份日志', 'url': self.get_model_url(DBBackTaskLog, 'changelist'), 'icon': self.get_model_icon(DBBackTaskLog)},

            )},
        )

xadmin.site.register(views.CommAdminView, GlobalSetting)
