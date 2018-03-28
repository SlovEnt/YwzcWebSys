
import xadmin

from .models import InserNewOrgInfo, InserNewOrgInfoLog, RunScriptsList



class InserNewOrgInfoInline(object):
    model = InserNewOrgInfoLog
    # readonly_fields = ['oper_sys', 'insert_datetime', 'log_txt']
    extra = 0


class InserNewOrgInfoAdmin(object):
    list_display = ['org_code', 'org_fname','sfc_code','sse_code','sza_ic','sza_unit','sha_ic','sha_unit','central_org']
    search_fields = ['insert_org_flag','org_code','org_fname','central_org']
    list_filter = ['insert_org_flag','org_code','org_fname','central_org']
    ordering = ["org_code"]
    # readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    # list_editable = ['use_object', 'remark']
    model_icon = "fa fa-newspaper-o"
    import_excel = True
    show_bookmarks = False
    inlines = [InserNewOrgInfoInline]

xadmin.site.register(InserNewOrgInfo, InserNewOrgInfoAdmin)


class InserNewOrgInfoLogAdmin(object):
    readonly_fields = ['oper_sys', 'insert_datetime', 'log_txt']
    hidden_menu = True # 隐藏模块 不在菜单中显示

class RunScriptsListAdmin(object):
    rtnHtml = r"http:\\sadfasd"
    exclude = ['run_status','run_point']
    list_display = ['script_name', 'script_desc','run_path','run_param', 'run_status', 'run_point']
    search_fields = ['script_name', 'run_status']
    readonly_fields = ['run_status']
    model_icon = "fa fa-cubes"

    # def run_script_do(self):
    #     obj = self.new_obj
    #     run_path_do = obj.script_name
    #     run_path_do.run_path = RunScriptsList.objects.filter(script_name=run_path_do)
    #     print(run_path_do.run_path)

xadmin.site.register(RunScriptsList, RunScriptsListAdmin)
