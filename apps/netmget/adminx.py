# -*- coding: utf-8 -*-
__author__ = 'SlovEnt'
__date__ = '2018/3/25 22:23'

import xadmin
from xadmin.views import CommAdminView


from .models import IpManage,Test168NetManage,Test169NetManage,Test170NetManage,Test171NetManage, \
    Net10Manage, Net16Manage, Net2Manage,Net5Manage,Net9Manage,Net12Manage,Net91Manage

class IpAllSet(object):
    model_icon = 'fa fa-link'
    show_bookmarks = False
    base_template = 'xadmin/base_site_cust.html'
    # add_form_template = 'base_site_cust.html'
    # change_form_template = 'base_site_cust.html'

    # 使用ueditor
    style_fields = {"remark": "ueditor"}

    # 分页显示的记录
    list_per_page = 100


class IpManageAdmin(object):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
# xadmin.site.register(IpManage, IpManageAdmin)

class Net2ManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Net2ManageAdmin, self).queryset()
        qs = qs.filter(net_tags="10.0.2.0")
        return qs

xadmin.site.register(Net2Manage, Net2ManageAdmin)

class Net5ManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Net5ManageAdmin, self).queryset()
        qs = qs.filter(net_tags="10.0.5.0")
        return qs

xadmin.site.register(Net5Manage, Net5ManageAdmin)

class Net9ManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Net9ManageAdmin, self).queryset()
        qs = qs.filter(net_tags="10.0.9.0")
        return qs

xadmin.site.register(Net9Manage, Net9ManageAdmin)

class Net10ManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Net10ManageAdmin, self).queryset()
        qs = qs.filter(net_tags="10.0.10.0")
        return qs

xadmin.site.register(Net10Manage, Net10ManageAdmin)

class Net12ManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Net12ManageAdmin, self).queryset()
        qs = qs.filter(net_tags="10.0.12.0")
        return qs

xadmin.site.register(Net12Manage, Net12ManageAdmin)

class Net16ManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["-id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Net16ManageAdmin, self).queryset()
        qs = qs.filter(net_tags="10.0.16.64")
        return qs

xadmin.site.register(Net16Manage, Net16ManageAdmin)

class Net91ManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Net91ManageAdmin, self).queryset()
        qs = qs.filter(net_tags="10.0.91.0")
        return qs

xadmin.site.register(Net91Manage, Net91ManageAdmin)

class Test168NetManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["-id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Test168NetManageAdmin, self).queryset()
        qs = qs.filter(net_tags="192.168.168.0")
        return qs

xadmin.site.register(Test168NetManage, Test168NetManageAdmin)

class Test169NetManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Test169NetManageAdmin, self).queryset()
        qs = qs.filter(net_tags="192.168.169.0")
        return qs

xadmin.site.register(Test169NetManage, Test169NetManageAdmin)

class Test170NetManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Test170NetManageAdmin, self).queryset()
        qs = qs.filter(net_tags="192.168.170.0")
        return qs

xadmin.site.register(Test170NetManage, Test170NetManageAdmin)

class Test171NetManageAdmin(IpAllSet):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    list_editable = ['use_object', 'remark']

    def queryset(self):
        qs = super(Test171NetManageAdmin, self).queryset()
        qs = qs.filter(net_tags="192.168.171.0")
        return qs

xadmin.site.register(Test171NetManage, Test171NetManageAdmin)
