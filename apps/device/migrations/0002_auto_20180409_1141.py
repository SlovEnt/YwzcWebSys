# Generated by Django 2.0.1 on 2018-04-09 11:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('device', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='devhardwarelist',
            name='hw_type',
            field=models.CharField(choices=[('1', 'CPU'), ('2', '内存'), ('3', '硬盘'), ('4', '光驱'), ('5', '电源'), ('6', '网卡'), ('99', '其他信息')], max_length=2, verbose_name='硬件类型'),
        ),
    ]
