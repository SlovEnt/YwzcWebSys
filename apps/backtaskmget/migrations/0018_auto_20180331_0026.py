# Generated by Django 2.0.1 on 2018-03-31 00:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backtaskmget', '0017_auto_20180331_0023'),
    ]

    operations = [
        migrations.AlterField(
            model_name='filebacktasklog',
            name='file_name',
            field=models.CharField(max_length=256, verbose_name='文件名'),
        ),
    ]
