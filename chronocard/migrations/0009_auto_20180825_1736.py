# Generated by Django 2.1 on 2018-08-26 00:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chronocard', '0008_auto_20180819_2147'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='eventuser',
            unique_together={('event', 'user')},
        ),
    ]
