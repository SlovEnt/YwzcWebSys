# Generated by Django 2.0.1 on 2018-03-29 15:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backtaskmget', '0011_filebacktaskexcludeset'),
    ]

    operations = [
        migrations.AlterField(
            model_name='filebacktaskexcludeset',
            name='proc_flag',
            field=models.CharField(choices=[('N', '暂停处理'), ('Y', '允许处理')], max_length=1, verbose_name='处理标识'),
        ),
        migrations.AlterField(
            model_name='filebacktaskset',
            name='proc_flag',
            field=models.CharField(default='Y', max_length=1, verbose_name='处理标识'),
        ),
    ]
