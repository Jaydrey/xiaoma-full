# Generated by Django 4.2.4 on 2023-08-17 15:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_alter_user_options_remove_user_status_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='profile_picture',
            field=models.URLField(null=True, verbose_name='profile picture'),
        ),
    ]
