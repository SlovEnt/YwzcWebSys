# Generated by Django 2.0.1 on 2018-03-29 20:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backtaskmget', '0014_auto_20180329_2000'),
    ]

    operations = [
        migrations.AddField(
            model_name='filebacktaskset',
            name='arch_nas_passwd',
            field=models.CharField(default='', max_length=128, verbose_name='归档路径密码'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='filebacktaskset',
            name='arch_nas_user',
            field=models.CharField(default='', max_length=32, verbose_name='归档路径用户名'),
            preserve_default=False,
        ),
    ]
