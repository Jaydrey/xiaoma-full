# Generated by Django 4.2.4 on 2023-08-14 13:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('trips', '0003_rename_destination_location_trip_dropoff_location_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='trip',
            old_name='destination_time',
            new_name='dropoff_time',
        ),
        migrations.RenameField(
            model_name='trip',
            old_name='start_time',
            new_name='pickup_time',
        ),
    ]
