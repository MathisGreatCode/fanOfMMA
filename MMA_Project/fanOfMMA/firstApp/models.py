from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from datetime import datetime
from django.core.exceptions import ValidationError

# Create your models here.
class Fighter(models.Model):
    name = models.CharField(max_length= 100)
    nickname = models.CharField(max_length=50, blank= True)
    win = models.IntegerField(default=0)
    loss = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class Organization(models.Model):
    name = models.CharField(max_length=20)
    country = models.CharField(max_length=50)
    description  = models.CharField(max_length=2500)

    def __str__(self):
        return self.name

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    fav_org = models.ForeignKey(Organization, on_delete=models.DO_NOTHING)
    fav_fighter = models.ForeignKey(Fighter, on_delete=models.DO_NOTHING, null = True)
    last_update = models.DateTimeField(User, auto_now=True)

    def __str__(self):
        return self.user.username
    
#class Publication(models.Model):
 #   user = models.ForeignKey(User, on_delete =models.DO_NOTHING)
  #  body = models.CharField(max_length=900)
   # created_time = models.DateTimeField(auto_now_add=True)

    #def __str__(self):
     #     return(f'{self.user.username}  '
      #           f'{self.created_time:%d.%m.%Y %H:%M}  '
       #          f'{self.body}')

    
    
#create Profile when new user sign up  (not needed now, i included the necessary code in view function register_v)
#@receiver(post_save, sender=User)
#def create_profile(sender, instance, created, **kwargs):
#    if created:
#        user_profile = instance.profile
#        user_profile.save()


class Event(models.Model):
    name = models.CharField(max_length=50)
    orga = models.ForeignKey(Organization, on_delete=models.DO_NOTHING)
    date_time = models.DateTimeField()
    place = models.CharField(max_length=40)
   
    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=20)
    kg= models.DecimalField(decimal_places=1, max_digits=4)
    lbs =models.IntegerField()

    def __str__(self):
        return self.name

class Fight(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    main_event = models.BooleanField(default=False)
    co_main = models.BooleanField(default=False)
    fighter1 = models.ForeignKey(Fighter, on_delete=models.DO_NOTHING, related_name="fighter1")
    fighter2 = models.ForeignKey(Fighter, on_delete=models.DO_NOTHING, related_name="fighter2")
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING)
    result = models.IntegerField(default = 0)

    def __str__(self):
        name1 = self.fighter1.name 
        name2 = self.fighter2.name
        if self.fighter1.nickname:
            name1 = name1.replace(' ', f" '{self.fighter1.nickname}' ")
        if self.fighter2.nickname:
            name2 = name2.replace(' ', f" '{self.fighter2.nickname}' ")
        if self.result == 1:
            name1 += ' (w) '
        if self.result == 2:
            name2 += ' (w) '

        return f"{name1} vs {name2} "
    



   
class Prediction(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    fight = models.ForeignKey(Fight, on_delete=models.CASCADE)
    winner = models.IntegerField(choices=((1, 'Fighter 1'), (2, 'Fighter 2')))

    class Meta:
        unique_together = ('user', 'fight')
    
