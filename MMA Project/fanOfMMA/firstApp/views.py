from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import HttpResponse
from .models import Profile, Organization

# Create your views here.


def home(request):
    return render(request, 'home.html')


def about_mma(request):
    return render(request, 'about.html')


def orgs(request):
    orgas = Organization.objects.all()
    return render(request, 'orgas.html', {'orgas': orgas})


def my_space(request):
    return render(request, 'space.html')


def calendar(request):
    return render(request, 'calendar.html')

def profile_list(request):
    if request.user.is_authenticated:
        profiles = Profile.objects.exclude(user=request.user)
        return render(request, 'profile_list.html', {'profiles': profiles})
    else:
        messages.success(request, "You must be logged in.")
        return redirect('home')
    
def org(request, pk):
    org = Organization.objects.get(id = pk)
    return render(request, 'orga.html', {'org': org})

def profile(request, pk):
    if request.user.is_authenticated:
        profile = Profile.objects.get(user_id= pk)
        return render(request, 'profile.html', {'profile': profile})
    else: 
        messages.success(request, "You must be logged in.")
        return redirect('home')
