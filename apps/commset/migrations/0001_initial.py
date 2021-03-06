# Generated by Django 2.0.1 on 2018-03-25 18:31

import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0009_alter_user_last_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('user_id', models.IntegerField(default=0, verbose_name='用户编码')),
                ('role_id', models.CharField(default='', max_length=11, verbose_name='权限组')),
                ('sex', models.CharField(choices=[('1', '男'), ('2', '女')], default='1', max_length=1, verbose_name='性别')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': '用户信息',
                'verbose_name_plural': '用户信息',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='SysDictItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dict_item', models.CharField(max_length=64, verbose_name='字典标识')),
                ('dict_item_name', models.CharField(max_length=128, verbose_name='标识名称')),
                ('org_id', models.CharField(default='0000', max_length=4, verbose_name='机构编码')),
                ('remark', models.TextField(blank=True, null=True, verbose_name='备注信息')),
            ],
            options={
                'verbose_name': '系统字典维护',
                'verbose_name_plural': '系统字典维护',
                'ordering': ('dict_name', 'dict_item', 'dict_item_name'),
            },
        ),
        migrations.CreateModel(
            name='SysDictName',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dict_name', models.CharField(blank=True, max_length=128, null=True, verbose_name='字典名称')),
                ('dict_type', models.CharField(blank=True, max_length=1, null=True, verbose_name='字典类别')),
                ('dict_proc_flag', models.CharField(blank=True, max_length=4, null=True, verbose_name='处理标识')),
            ],
            options={
                'verbose_name': '系统字典',
                'verbose_name_plural': '系统字典',
            },
        ),
        migrations.AddField(
            model_name='sysdictitem',
            name='dict_name',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='commset.SysDictName', verbose_name='字典名称'),
        ),
    ]
