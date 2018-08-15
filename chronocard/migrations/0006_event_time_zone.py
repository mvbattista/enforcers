# Generated by Django 2.0.4 on 2018-08-15 14:14

from django.db import migrations
import timezone_field.fields


class Migration(migrations.Migration):

    dependencies = [
        ('chronocard', '0005_auto_20180705_1553'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='time_zone',
            field=timezone_field.fields.TimeZoneField(default='US/Eastern'),
        ),
    ]
