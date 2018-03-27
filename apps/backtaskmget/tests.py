from django.test import TestCase

# Create your tests here.



paras = '''
    insert_org_flag = models.CharField(max_length=1, choices=GetSysDict("INSERT_ORG_FLAG"), default="0", verbose_name="任务名称")
    org_code = models.IntegerField(verbose_name="营业部编码")
    org_name = models.CharField(max_length=64, verbose_name="营业部简称")
    org_fname = models.FileField(max_length=64,verbose_name="营业部全称")
    area_code = models.CharField(max_length=8, verbose_name="区号")
    post_code = models.CharField(max_length=16, verbose_name="邮编")
    address = models.CharField(max_length=255, verbose_name="地址")
    tel = models.CharField(max_length=16, default="0", verbose_name="联系电话")
    sfc_code = models.CharField(max_length=8, verbose_name="证监会代码")
    sse_code = models.CharField(max_length=8, verbose_name="上交所唯一码")
    sza_ic = models.CharField(max_length=4, verbose_name="深A标识码")
    sza_unit = models.CharField(max_length=8, verbose_name="深A交易单元")
    sza_trd_interval = models.CharField(max_length=32, verbose_name="深A交易区间")
    szb_trd_interval = models.CharField(max_length=32, verbose_name="深B交易区间")
    sta_trd_interval = models.CharField(max_length=32, verbose_name="股转A交易区间")
    szhk_trd_interval = models.CharField(max_length=32, verbose_name="深港通交易区间")
    sha_ic = models.CharField(max_length=4, verbose_name="沪A标识码")
    sha_unit = models.CharField(max_length=8, verbose_name="沪A交易单元")
    sha_trd_interval = models.CharField(max_length=32, verbose_name="沪A交易区间")
    shb_trd_interval = models.CharField(max_length=32, verbose_name="沪B交易区间")
    central_org = models.IntegerField(verbose_name="中心营业部编码")
'''

lineStr = ""
for x in paras.splitlines():
    paraArr = x.split("=")
    print(paraArr[0].replace(" ",""))
    lineStr = "'%s,'%s'" %  (lineStr, paraArr[0].replace(" ",""))
print(lineStr)