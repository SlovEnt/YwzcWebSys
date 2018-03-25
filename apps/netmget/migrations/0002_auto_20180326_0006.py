# Generated by Django 2.0.1 on 2018-03-26 00:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('netmget', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Net10Manage',
            fields=[
            ],
            options={
                'verbose_name': '10.0.10.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '10.0.10.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Net12Manage',
            fields=[
            ],
            options={
                'verbose_name': '10.0.12.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '10.0.12.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Net16Manage',
            fields=[
            ],
            options={
                'verbose_name': '10.0.16.64',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '10.0.16.64',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Net2Manage',
            fields=[
            ],
            options={
                'verbose_name': '10.0.2.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '10.0.2.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Net5Manage',
            fields=[
            ],
            options={
                'verbose_name': '10.0.5.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '10.0.5.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Net9Manage',
            fields=[
            ],
            options={
                'verbose_name': '10.0.9.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '10.0.9.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Test168NetManage',
            fields=[
            ],
            options={
                'verbose_name': '192.168.168.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '192.168.168.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Test169NetManage',
            fields=[
            ],
            options={
                'verbose_name': '192.168.169.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '192.168.169.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Test170NetManage',
            fields=[
            ],
            options={
                'verbose_name': '192.168.170.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '192.168.170.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.CreateModel(
            name='Test171NetManage',
            fields=[
            ],
            options={
                'verbose_name': '192.168.171.0',
                'indexes': [],
                'proxy': True,
                'verbose_name_plural': '192.168.171.0',
            },
            bases=('netmget.ipmanage',),
        ),
        migrations.AlterField(
            model_name='ipmanage',
            name='remark',
            field=models.TextField(blank=True, verbose_name='备注信息'),
        ),
        migrations.AlterField(
            model_name='ipmanage',
            name='use_object',
            field=models.CharField(blank=True, max_length=255, verbose_name='使用对象'),
        ),
    ]
