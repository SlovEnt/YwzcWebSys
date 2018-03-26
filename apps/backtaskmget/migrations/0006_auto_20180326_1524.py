# Generated by Django 2.0.1 on 2018-03-26 15:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backtaskmget', '0005_auto_20180326_1426'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dbbacktasklog',
            name='db_type',
            field=models.CharField(choices=[('MSSQL', 'MSSQL'), ('MYSQL', 'MYSQL'), ('ORACLE', 'ORACLE')], default='ORACLE', max_length=8, verbose_name='数据库类型'),
        ),
        migrations.AlterField(
            model_name='dbbacktasklog',
            name='md5_string',
            field=models.CharField(max_length=64, verbose_name='MD5校验码'),
        ),
        migrations.AlterField(
            model_name='dbbacktaskset',
            name='db_type',
            field=models.CharField(choices=[('MSSQL', 'MSSQL'), ('MYSQL', 'MYSQL'), ('ORACLE', 'ORACLE')], default='ORACLE', max_length=8, null=True, verbose_name='数据库类型'),
        ),
        migrations.AlterField(
            model_name='dbbacktaskset',
            name='db_user',
            field=models.CharField(max_length=16, verbose_name='数据库用户'),
        ),
        migrations.AlterField(
            model_name='dbbacktaskset',
            name='db_user_passwd',
            field=models.CharField(max_length=32, verbose_name='数据库用户密码'),
        ),
        migrations.AlterField(
            model_name='dbbacktaskset',
            name='host_user',
            field=models.CharField(max_length=32, verbose_name='系统用户名'),
        ),
    ]