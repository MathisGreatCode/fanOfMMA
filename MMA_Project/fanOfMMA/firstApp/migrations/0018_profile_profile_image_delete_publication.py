# Generated by Django 4.2 on 2023-07-05 12:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("firstApp", "0017_fight_co_main"),
    ]

    operations = [
        migrations.AddField(
            model_name="profile",
            name="profile_image",
            field=models.ImageField(
                blank=True, null=True, upload_to="static/images/profile_pics"
            ),
        ),
        migrations.DeleteModel(
            name="Publication",
        ),
    ]
