# Generated by Django 4.1.6 on 2023-03-25 16:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("firstApp", "0004_alter_fighter_nickname"),
    ]

    operations = [
        migrations.AlterField(
            model_name="profile",
            name="fav_org",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.DO_NOTHING,
                to="firstApp.organization",
            ),
        ),
    ]
