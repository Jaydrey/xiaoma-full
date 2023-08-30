# Generated by Django 4.2.4 on 2023-08-16 13:57

from django.conf import settings
import django.contrib.gis.db.models.fields
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, verbose_name='status id')),
                ('type', models.CharField(max_length=10, unique=True, verbose_name='status type')),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now, editable=False, verbose_name='date created')),
            ],
            options={
                'verbose_name': 'status',
                'verbose_name_plural': 'statuses',
                'ordering': ('type',),
                'default_related_name': 'statuses',
                'indexes': [models.Index(fields=['id', 'type'], name='accounts_st_id_1b7a2e_idx')],
            },
        ),
        migrations.CreateModel(
            name='RiderAccount',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, verbose_name='status id')),
                ('home_address', django.contrib.gis.db.models.fields.PointField(geography=True, null=True, srid=4326)),
                ('work_address', django.contrib.gis.db.models.fields.PointField(geography=True, null=True, srid=4326)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now, editable=False, verbose_name='date created')),
                ('updated_at', models.DateTimeField(default=django.utils.timezone.now, editable=False, verbose_name='edited date')),
                ('status', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='accounts.status', verbose_name='account status')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL, verbose_name='user account')),
            ],
            options={
                'verbose_name': 'account',
                'verbose_name_plural': 'rider_accounts',
                'ordering': ('-created_at',),
                'default_related_name': 'rider_accounts',
                'indexes': [models.Index(fields=['id'], name='accounts_ri_id_cf2436_idx')],
            },
        ),
    ]
