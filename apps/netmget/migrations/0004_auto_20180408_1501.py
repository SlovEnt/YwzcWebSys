# Generated by Django 2.0.1 on 2018-04-08 15:01

import DjangoUeditor.models
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('netmget', '0003_net91manage'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ipmanage',
            name='remark',
            field=DjangoUeditor.models.UEditorField(blank=True, default='', verbose_name='备注信息'),
        ),
    ]
