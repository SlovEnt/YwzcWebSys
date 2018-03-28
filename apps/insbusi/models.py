from django.db import models

# Create your models here.

from datetime import datetime
from commset.GetSysInfo import GetSysDict


class InserNewOrgInfo(models.Model):
    insert_org_flag = models.CharField(max_length=1, choices=GetSysDict("INSERT_ORG_FLAG"), default="0", verbose_name="流程标识")
    org_code = models.CharField(max_length=8, verbose_name="营业部编码")
    org_name = models.CharField(max_length=64, verbose_name="营业部简称")
    org_fname = models.CharField(max_length=64,verbose_name="营业部全称")
    area_code = models.CharField(max_length=8, verbose_name="区号")
    post_code = models.CharField(max_length=16, verbose_name="邮编")
    address = models.CharField(max_length=255, verbose_name="地址")
    tel = models.CharField(max_length=16, default="0", verbose_name="联系电话")
    sfc_code = models.CharField(max_length=8, verbose_name="证监会代码")
    sse_code = models.CharField(max_length=8, verbose_name="上交所唯一码")
    sza_unit = models.CharField(max_length=8, verbose_name="深A交易单元")
    sza_ic = models.CharField(max_length=4, verbose_name="深A标识码")
    sza_trd_interval = models.CharField(max_length=32, verbose_name="深A交易区间")
    szb_trd_interval = models.CharField(max_length=32, verbose_name="深B交易区间")
    sta_trd_interval = models.CharField(max_length=32, verbose_name="股转A交易区间")
    szhk_trd_interval = models.CharField(max_length=32, verbose_name="深港通交易区间")
    sha_unit = models.CharField(max_length=8, verbose_name="沪A交易单元")
    sha_ic = models.CharField(max_length=4, verbose_name="沪A标识码")
    sha_trd_interval = models.CharField(max_length=32, verbose_name="沪A交易区间")
    shb_trd_interval = models.CharField(max_length=32, verbose_name="沪B交易区间")
    central_org = models.CharField(max_length=8, blank=True, verbose_name="中心营业部编码")

    class Meta:
        verbose_name = u"批量加新营业部"
        verbose_name_plural = verbose_name
        ordering = ('org_code',)

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return "营业部编码为：%s 的记录" % self.org_code



class InserNewOrgInfoLog(models.Model):
    org_code = models.ForeignKey(InserNewOrgInfo, on_delete=models.CASCADE, verbose_name="营业部编码")
    oper_sys = models.CharField(max_length=32, verbose_name="处理系统名称")
    insert_datetime = models.DateTimeField(default=datetime.now, verbose_name="执行时间")
    log_txt = models.TextField(blank=True, verbose_name="日志记录")

    class Meta:
        verbose_name = u"营业部添加日志"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s已处理 %s " % (self.oper_sys, self.org_code)


class RunScriptsList(models.Model):
    script_name = models.CharField(max_length=128, verbose_name="函数名称")
    script_desc = models.CharField(max_length=128, verbose_name="函数说明")
    run_status = models.CharField(max_length=1, choices=GetSysDict("RUN_STATUS"), default="0", verbose_name="执行状态")
    run_path = models.CharField(max_length=128,verbose_name="执行路径") # 格式 /xadmin/RunScript
    run_param = models.TextField(verbose_name="执行参数") # 格式 {ID:id,load:lo}

    def run_point(self):
        from django.utils.safestring import mark_safe
        # rtnHtml = '''<a href="/apps/%s/" class="btn btn-primary">执行</a>''' % self.run_path
        rtnHtml = '''
            <script type="text/javascript">
                    function %s(id,lo) {
                        $.ajax({
                            url:"%s",
                            data:%s,
                            type:'POST',
                            success:function(json){
                               var data = $.parseJSON(json);
                                if( data ) {
                                    $.each(data, function (key, value) {
                                        var st=""
                                        for(var i=0;i<value.length-1;i++){
                                             st += value[i]
                                             st +="</br>"
                                        }
                                    });
                                }
                            }
                        });
                   }
            </script>
            <a class="btn btn-primary" onclick="%s();">执行</a>
            ''' % (self.script_name, self.run_path, self.run_param, self.script_name)
        return mark_safe(rtnHtml)
    run_point.short_description = "执行"

    class Meta:
        verbose_name = u"函数执行表"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s" % (self.script_name)
