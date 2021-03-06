# Generated by Django 2.0.1 on 2018-04-08 15:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commset', '0014_auto_20180407_2243'),
    ]

    operations = [
        migrations.AlterField(
            model_name='menulist',
            name='titleA',
            field=models.CharField(choices=[('1', '全局参数'), ('2', '系统管理'), ('3', 'IP地址管理'), ('4', '备份任务管理'), ('5', '机构业务'), ('6', '设备管理')], max_length=64, verbose_name='一级菜单名称'),
        ),
        migrations.AlterField(
            model_name='sysdictname',
            name='dict_cls',
            field=models.CharField(choices=[('1', '全局参数'), ('2', '系统管理'), ('3', 'IP地址管理'), ('4', '备份任务管理'), ('5', '机构业务'), ('6', '设备管理')], default='0', max_length=1, verbose_name='字典类别'),
        ),
        migrations.AlterField(
            model_name='sysparam',
            name='param_cls',
            field=models.CharField(choices=[('1', '全局参数'), ('2', '系统管理'), ('3', 'IP地址管理'), ('4', '备份任务管理'), ('5', '机构业务'), ('6', '设备管理')], default='1', max_length=2, verbose_name='参数分类'),
        ),
    ]
