# Generated by Django 2.0.1 on 2018-03-26 14:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backtaskmget', '0004_auto_20180326_1425'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dbbacktasklog',
            name='file_name',
            field=models.FileField(upload_to='', verbose_name='归档文件名'),
        ),
    ]
