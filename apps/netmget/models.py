from django.db import models

# Create your models here.

from DjangoUeditor.models import UEditorField

class IpManage(models.Model):
    ip_addr = models.GenericIPAddressField(max_length=32, verbose_name="IP地址")
    net_tags = models.GenericIPAddressField(max_length=32, verbose_name="所属网段")
    sub_mask = models.GenericIPAddressField(max_length=32, verbose_name="子网掩码")
    gateway = models.GenericIPAddressField(max_length=32, verbose_name="网关地址")
    use_object = models.CharField(max_length=255, blank=True, verbose_name="使用对象")
    remark = UEditorField(blank=True,verbose_name="备注信息", width=800, height=400, imagePath="netmget/ueditor/", filePath="netmget/ueditor/", default='')

    class Meta:
        verbose_name = u"IP地址管理"
        verbose_name_plural = verbose_name

    def __str__(self):
        return 'IP地址：{0} 使用对象为：{1}'.format(self.ip_addr, self.use_object)


class Test168NetManage(IpManage):
    class Meta:
        verbose_name = u"192.168.168.0"
        verbose_name_plural = verbose_name
        proxy = True

class Test169NetManage(IpManage):
    class Meta:
        verbose_name = u"192.168.169.0"
        verbose_name_plural = verbose_name
        proxy = True

class Test170NetManage(IpManage):
    class Meta:
        verbose_name = u"192.168.170.0"
        verbose_name_plural = verbose_name
        proxy = True

class Test171NetManage(IpManage):
    class Meta:
        verbose_name = u"192.168.171.0"
        verbose_name_plural = verbose_name
        proxy = True


class Net10Manage(IpManage):
    class Meta:
        verbose_name = u"10.0.10.0"
        verbose_name_plural = verbose_name
        proxy = True


class Net16Manage(IpManage):
    class Meta:
        verbose_name = u"10.0.16.64"
        verbose_name_plural = verbose_name
        proxy = True


class Net2Manage(IpManage):
    class Meta:
        verbose_name = u"10.0.2.0"
        verbose_name_plural = verbose_name
        proxy = True

class Net5Manage(IpManage):
    class Meta:
        verbose_name = u"10.0.5.0"
        verbose_name_plural = verbose_name
        proxy = True

class Net12Manage(IpManage):
    class Meta:
        verbose_name = u"10.0.12.0"
        verbose_name_plural = verbose_name
        proxy = True

class Net9Manage(IpManage):
    class Meta:
        verbose_name = u"10.0.9.0"
        verbose_name_plural = verbose_name
        proxy = True

class Net91Manage(IpManage):
    class Meta:
        verbose_name = u"10.0.91.0"
        verbose_name_plural = verbose_name
        proxy = True

