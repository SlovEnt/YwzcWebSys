
import xadmin
from django.contrib.auth.models import Group, Permission
from xadmin.plugins.auth import UserAdmin, Group
from xadmin.models import Log

# 和X admin的view绑定
from xadmin import views
from .models import DevBaseInfo, DevHardwareList, DevMaintInfo, MaintRecords
from DjangoUeditor.widgets import UEditorWidget

class DevBaseInfoInline(object):
    model = DevHardwareList
    extra = 0


class DevBaseInfoAdmin(object):
    list_display = ['dev_id','dev_name','dev_sn','dev_pn','dev_type','dev_brand','dev_model','pur_date','use_date','warranty_exp','dev_status']
    search_fields = ['dev_id','dev_name','procur_project','dev_sn','dev_pn','dev_type','dev_brand','dev_model','pur_date','use_date','warranty_exp','dev_status','remark']
    list_filter = ['dev_id','dev_name','procur_project','dev_sn','dev_pn','dev_type','dev_brand','dev_model','pur_date','use_date','warranty_exp','dev_status','remark']
    ordering = ["dev_id"]
    # inlines = [DevBaseInfoInline,]
    # readonly_fields = ['param_en_name', 'param_name']
    model_icon = 'fa fa-braille'
    style_fields = {"remark": "ueditor"}

xadmin.site.register(DevBaseInfo, DevBaseInfoAdmin)


class DevHardwareListAdmin(object):
    list_display = ['dev_id','hw_type','num_sum','hw_desc']
    search_fields = ['dev_id','hw_type','num_sum','hw_desc']
    list_filter = ['dev_id','hw_type','num_sum','hw_desc']
    # ordering = ["dev_id"]
    # readonly_fields = ['param_en_name', 'param_name']
    model_icon = 'fa fa-microchip'

xadmin.site.register(DevHardwareList, DevHardwareListAdmin)


class DevMaintInfoAdmin(object):
    list_display = ['dev_id','dev_position','cabinet_space','coherent_sys','os_type','dev_rank','supplier_name','maint_unit','maint_unit_tel','responsible']
    search_fields = ['dev_id','dev_position','cabinet_space','coherent_sys','os_type','dev_rank','supplier_name','maint_unit','maint_unit_tel','responsible']
    list_filter = ['dev_id','dev_position','cabinet_space','coherent_sys','os_type','dev_rank','supplier_name','maint_unit','maint_unit_tel','responsible']
    # ordering = ["dev_id"]
    # readonly_fields = ['param_en_name', 'param_name']
    model_icon = 'fa fa-legal'

xadmin.site.register(DevMaintInfo, DevMaintInfoAdmin)


class MaintRecordsAdmin(object):
    list_display = ['dev_id','mainta_date','instructions']
    search_fields = ['dev_id','mainta_date','instructions']
    list_filter = ['dev_id','mainta_date','instructions']
    # ordering = ["dev_id"]
    # readonly_fields = ['param_en_name', 'param_name']
    model_icon = 'fa fa-magic'
    style_fields = {"instructions": "ueditor"}

xadmin.site.register(MaintRecords, MaintRecordsAdmin)

