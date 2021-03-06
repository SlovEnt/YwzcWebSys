# Generated by Django 2.0.1 on 2018-03-25 22:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commset', '0003_auto_20180325_2143'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='sysdictitem',
            options={'ordering': ('dict_name', 'dict_item', 'dict_item_name'), 'verbose_name': '系统字典类别', 'verbose_name_plural': '系统字典类别'},
        ),
        migrations.AlterModelOptions(
            name='sysdictname',
            options={'ordering': ('dict_name',), 'verbose_name': '系统字典', 'verbose_name_plural': '系统字典'},
        ),
        migrations.AlterField(
            model_name='sysdictname',
            name='dict_en_name',
            field=models.CharField(max_length=16, null=True, verbose_name='字典简码'),
        ),
        migrations.AlterField(
            model_name='sysdictname',
            name='dict_name',
            field=models.CharField(max_length=128, null=True, verbose_name='字典名称'),
        ),
        migrations.AlterField(
            model_name='sysdictname',
            name='dict_proc_flag',
            field=models.CharField(choices=[('1', '可读取'), ('2', '已停用')], default='1', max_length=4, null=True, verbose_name='处理标识'),
        ),
        migrations.AlterField(
            model_name='sysdictname',
            name='dict_type',
            field=models.CharField(choices=[('0', '全局字典'), ('1', '备份模块字典'), ('2', '采集模块字典')], default='0', max_length=1, verbose_name='字典类别'),
        ),
    ]
