# Generated by Django 2.0.1 on 2018-03-26 20:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commset', '0005_auto_20180326_2029'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sysdictname',
            name='dict_proc_flag',
            field=models.CharField(choices=[('0', '隐藏'), ('1', '可见'), ('2', '可修改'), ('3', '可删除')], default='3', max_length=4, null=True, verbose_name='处理标识'),
        ),
    ]