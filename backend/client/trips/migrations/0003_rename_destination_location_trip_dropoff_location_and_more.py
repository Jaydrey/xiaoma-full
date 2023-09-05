# Generated by Django 4.2.4 on 2023-08-14 12:41

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('trips', '0002_cancellationreason_trip_cancellation_reason'),
    ]

    operations = [
        migrations.RenameField(
            model_name='trip',
            old_name='destination_location',
            new_name='dropoff_location',
        ),
        migrations.RenameField(
            model_name='trip',
            old_name='start_location',
            new_name='pickup_location',
        ),
        migrations.AlterField(
            model_name='trip',
            name='driver',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='driver', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='trip',
            name='rider',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='rider', to=settings.AUTH_USER_MODEL),
        ),
    ]
