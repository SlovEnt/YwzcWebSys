# Generated by Django 2.0.1 on 2018-04-07 14:19

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('commset', '0008_calendar'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='calendar',
            unique_together={('bookset', 'physical_date')},
        ),
    ]
