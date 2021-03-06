# Generated by Django 2.0.1 on 2018-03-27 23:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('insbusi', '0004_remove_inserneworginfolog_insert_org_flag'),
    ]

    operations = [
        migrations.CreateModel(
            name='RunScriptsList',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('script_name', models.CharField(max_length=128, verbose_name='函数名称')),
                ('run_status', models.CharField(choices=[('0', '暂停'), ('1', '运行中'), ('2', '执行异常')], default='0', max_length=1, verbose_name='执行状态')),
            ],
            options={
                'verbose_name_plural': '函数执行表',
                'verbose_name': '函数执行表',
            },
        ),
    ]
