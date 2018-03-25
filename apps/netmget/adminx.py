# -*- coding: utf-8 -*-
__author__ = 'SlovEnt'
__date__ = '2018/3/25 22:23'


import xadmin
# 和X admin的view绑定
from xadmin import views

from .models import IpManage,Test168NetManage,Test169NetManage,Test170NetManage,Test171NetManage, \
    Net10Manage, Net16Manage, Net2Manage,Net5Manage,Net9Manage,Net12Manage


class IpManageAdmin(object):
    list_display = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    search_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object']
    list_filter = ['ip_addr', 'net_tags', 'sub_mask', 'gateway', 'use_object', 'remark']
    ordering = ["id"]
    readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
# xadmin.site.register(IpManage, IpManageAdmin)

class Net2ManageAdmin(object):
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

class Net5ManageAdmin(object):
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

class Net9ManageAdmin(object):
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

class Net10ManageAdmin(object):
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

class Net12ManageAdmin(object):
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


class Net16ManageAdmin(object):
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


class Test168NetManageAdmin(object):
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

class Test169NetManageAdmin(object):
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

class Test170NetManageAdmin(object):
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

class Test171NetManageAdmin(object):
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
