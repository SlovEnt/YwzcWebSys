import xadmin
from xadmin import views
from .models import DBBackTaskSet, DBBackTaskLog

class DBBackTaskSetAdmin(object):
    list_display = ['task_name','host_ip','host_user','db_type','db_sid','is_compre','compre_type','is_compre_passwd','file_save_path','names_of_backdb','reserved_day','proc_flag','task_run_time']
    search_fields = ['task_name','host_ip','db_type','is_compre','compre_type','is_compre_passwd','reserved_day','proc_flag']
    list_filter = ['task_name','host_ip','db_type','is_compre','compre_type','is_compre_passwd','reserved_day','proc_flag']
    ordering = ["task_name"]
    # readonly_fields = ['ip_addr', 'net_tags', 'sub_mask', 'gateway']
    # list_editable = ['use_object', 'remark']

    # def queryset(self):
    #     qs = super(DBBackTaskSetAdmin, self).queryset()
    #     qs = qs.filter(net_tags="10.0.2.0")
    #     return qs

xadmin.site.register(DBBackTaskSet, DBBackTaskSetAdmin)


class DBBackTaskLogAdmin(object):
    list_display = ['task_name','task_run_date','task_run_time','host_ip','db_type','names_of_backdb','file_name','compre_type','file_save_path','arch_nas_path','compre_passwd','file_siz','md5_string','remark']
    search_fields = ['task_name','task_run_date','task_run_time','host_ip','db_type','names_of_backdb','file_name','compre_type','file_save_path','arch_nas_path','compre_passwd','file_siz','md5_string','remark']
    list_filter = ['task_name','task_run_date','task_run_time','host_ip','db_type','names_of_backdb','file_name','compre_type','file_save_path','arch_nas_path','compre_passwd','file_siz','md5_string','remark']
    ordering = ['task_run_date','task_run_time', "task_name"]
    readonly_fields = ['task_name','task_run_date','task_run_time','host_ip','db_type','names_of_backdb','file_name','compre_type','file_save_path','arch_nas_path','compre_passwd','file_siz','md5_string','remark']
    # list_editable = ['use_object', 'remark']

    # def queryset(self):
    #     qs = super(DBBackTaskSetAdmin, self).queryset()
    #     qs = qs.filter(net_tags="10.0.2.0")
    #     return qs

xadmin.site.register(DBBackTaskLog, DBBackTaskLogAdmin)

