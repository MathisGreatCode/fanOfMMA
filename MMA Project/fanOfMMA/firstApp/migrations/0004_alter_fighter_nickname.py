# Generated by Django 4.1.6 on 2023-03-25 15:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("firstApp", "0003_fighter_loss_fighter_win"),
    ]

    operations = [
        migrations.AlterField(
            model_name="fighter",
            name="nickname",
            field=models.CharField(blank=True, max_length=50),
        ),
    ]
