# Generated by Django 2.0.1 on 2018-03-31 12:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backtaskmget', '0020_auto_20180331_0040'),
    ]

    operations = [
        migrations.AddField(
            model_name='filebacktasklog',
            name='task_status',
            field=models.CharField(choices=[('1', '完成'), ('2', '忽略'), ('3', '失败')], default='', max_length=1, verbose_name='任务状态'),
            preserve_default=False,
        ),
    ]