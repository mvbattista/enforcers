# Generated by Django 2.0.4 on 2018-07-05 15:53

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('chronocard', '0004_auto_20180625_2029'),
    ]

    operations = [
        migrations.AlterField(
            model_name='checkin',
            name='start_date',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
