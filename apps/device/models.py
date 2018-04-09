from django.db import models

# Create your models here.

from datetime import datetime
from commset.GetSysInfo import GetSysDict
from DjangoUeditor.models import UEditorField


class DevBaseInfo(models.Model):
    dev_id = models.CharField(max_length=32, verbose_name="设备编号")
    dev_name = models.CharField(max_length=128, verbose_name="设备名称/用途")
    procur_project = models.CharField(max_length=128, verbose_name="购置项目名称")
    dev_sn = models.CharField(max_length=32, verbose_name="设备SN号")
    dev_pn = models.CharField(max_length=32, verbose_name="设备PN号")
    dev_type = models.CharField(max_length=2, choices=GetSysDict("DEV_TYPE"), verbose_name="设备类型")
    dev_brand = models.CharField(max_length=2, choices=GetSysDict("DEV_BRAND"), verbose_name="设备品牌")
    dev_model = models.CharField(max_length=32, verbose_name="设备型号")
    pur_date = models.DateField(null=True, blank=True, verbose_name="采购日期")
    use_date = models.DateField(null=True, blank=True, verbose_name="上线日期")
    warranty_exp = models.CharField(max_length=2, choices=GetSysDict("WARRANTY_EXP"), verbose_name="质保年限")
    dev_status = models.CharField(max_length=1, choices=GetSysDict("DEV_STATUS"), verbose_name="设备状态")
    remark = UEditorField(blank=True,verbose_name="备注信息", width=800, height=400, imagePath="device/ueditor/", filePath="device/ueditor/", default='')

    class Meta:
        verbose_name = u"设备基本信息"
        verbose_name_plural = verbose_name
        unique_together = ('dev_id',)
        index_together = ('dev_name',)

    def __str__(self):
        return '编号：{1} 设备：{0}'.format(self.dev_name, self.dev_id)


class DevHardwareList(models.Model):
    dev_id = models.ForeignKey(DevBaseInfo, on_delete=models.CASCADE, verbose_name="设备编号")
    hw_type = models.CharField(max_length=2, choices=GetSysDict("HD_TYPE"), verbose_name="硬件类型")
    num_sum = models.IntegerField(null=True, blank=True, verbose_name="数量")
    hw_desc = models.CharField(max_length=128, null=True, blank=True, verbose_name="硬件描述")

    class Meta:
        verbose_name = u"设备硬件信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.hw_type


class DevMaintInfo(models.Model):
    dev_id = models.ForeignKey(DevBaseInfo, on_delete=models.CASCADE, verbose_name="设备编号")
    dev_position = models.CharField(max_length=64, verbose_name="设备位置")
    cabinet_space = models.CharField(max_length=64, verbose_name="机柜位置")
    coherent_sys = models.CharField(max_length=128, verbose_name="关联系统")
    os_type = models.CharField(max_length=2, choices=GetSysDict("OS_TYPE"), verbose_name="操作系统")
    dev_rank = models.CharField(max_length=2, choices=GetSysDict("DEV_RANK"), verbose_name="设备等级")
    supplier_name = models.CharField(max_length=32, verbose_name="供货商")
    maint_unit = models.CharField(max_length=32, verbose_name="维保单位")
    maint_unit_tel = models.CharField(max_length=32, verbose_name="维保联系电话")
    responsible = models.CharField(max_length=32, verbose_name="运维责任人")

    class Meta:
        verbose_name = u"设备维保信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.dev_position


class MaintRecords(models.Model):
    dev_id = models.ForeignKey(DevBaseInfo, on_delete=models.CASCADE, verbose_name="设备编号")
    mainta_date = models.DateField(verbose_name="维修日期")
    instructions = UEditorField(blank=True, verbose_name="维修项目说明", width=800, height=400, imagePath="device/ueditor/",
                          filePath="device/ueditor/", default='')

    class Meta:
        verbose_name = u"设备维保记录"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.mainta_date
