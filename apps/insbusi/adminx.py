
import xadmin

from .models import InserNewOrgInfo

class InserNewOrgInfoAdmin(object):
    list_display = ['org_code', 'org_fname','sfc_code','sse_code','sza_ic','sza_unit','sha_ic','sha_unit','central_org','insert_org_flag']
    search_fields = ['insert_org_flag','org_code','org_fname','central_org']
    list_filter = ['insert_org_flag','org_code','org_fname','central_org']
    ordering = ["org_code"]
    # readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    # list_editable = ['use_object', 'remark']
    model_icon = "fa fa-newspaper-o"
    show_bookmarks = False


xadmin.site.register(InserNewOrgInfo, InserNewOrgInfoAdmin)






