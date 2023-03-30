from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


# Create your models here.
class Fighter(models.Model):
    name = models.CharField(max_length=100)
    nickname = models.CharField(max_length=50, blank= True)
    win = models.IntegerField(default=0)
    loss = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class Organization(models.Model):
    name = models.CharField(max_length=20)
    country = models.CharField(max_length=50)
    description  = models.CharField(max_length=600)

    def __str__(self):
        return self.name

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    fav_org = models.ForeignKey(Organization, on_delete=models.DO_NOTHING)
    fav_fighter = models.ForeignKey(Fighter, on_delete=models.DO_NOTHING, null = True)
    last_update = models.DateTimeField(User, auto_now=True)

    def __str__(self):
        return self.user.username
    
#create Profile when new user sign up
@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        user_profile = instance.profile
        user_profile.save()

