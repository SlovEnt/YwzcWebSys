# Generated by Django 2.0.1 on 2018-03-29 14:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backtaskmget', '0008_auto_20180326_2029'),
    ]

    operations = [
        migrations.CreateModel(
            name='FileBackTaskLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('task_name', models.CharField(max_length=128, verbose_name='任务名称')),
                ('task_run_date', models.DateField(verbose_name='任务执行日期')),
                ('task_run_time', models.TimeField(verbose_name='任务执行时间')),
                ('host_ip', models.GenericIPAddressField(verbose_name='主机IP')),
                ('file_modify_dt', models.DateTimeField(verbose_name='文件修改时间')),
                ('md5_string', models.CharField(max_length=64, verbose_name='MD5校验码')),
                ('file_name', models.FileField(upload_to='', verbose_name='文件名')),
                ('file_save_path', models.CharField(max_length=255, verbose_name='原始路径')),
                ('arch_nas_path', models.CharField(max_length=255, verbose_name='归档路径')),
                ('file_siz', models.FilePathField(verbose_name='文件大小（kb）')),
                ('remark', models.TextField(verbose_name='备注信息')),
            ],
            options={
                'verbose_name': '文件备份日志',
                'verbose_name_plural': '文件备份日志',
                'ordering': ('task_run_date', 'task_run_time'),
            },
        ),
        migrations.CreateModel(
            name='FileBackTaskSet',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('task_name', models.CharField(max_length=128, verbose_name='任务名称')),
                ('host_ip', models.GenericIPAddressField(verbose_name='主机IP')),
                ('host_user', models.CharField(max_length=32, verbose_name='系统用户名')),
                ('host_user_passwd', models.CharField(max_length=128, verbose_name='用户密码')),
                ('file_save_path', models.CharField(max_length=255, verbose_name='文件原始路径')),
                ('arch_nas_path', models.CharField(max_length=255, verbose_name='归档路径')),
                ('reserved_day', models.IntegerField(verbose_name='备份切转天数')),
                ('proc_flag', models.CharField(choices=[('N', '暂停处理'), ('Y', '允许处理')], default='Y', max_length=1, verbose_name='处理标识')),
                ('task_run_time', models.TimeField(verbose_name='任务执行时间')),
            ],
            options={
                'verbose_name': '文件备份任务',
                'verbose_name_plural': '文件备份任务',
                'ordering': ('task_name',),
            },
        ),
        migrations.AddField(
            model_name='dbbacktaskset',
            name='arch_nas_path',
            field=models.CharField(default='', max_length=255, verbose_name='归档路径'),
            preserve_default=False,
        ),
    ]
