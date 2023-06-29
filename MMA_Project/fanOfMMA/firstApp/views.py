from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import HttpResponse
from .models import Profile, Organization, Prediction, Event, Fight
from .forms import  SignUpForm, PredictionForm
from django.contrib.auth import authenticate, login, logout
from datetime import datetime
from django.contrib.auth.models import User
from django.views.generic import TemplateView
# Create your views here.


def home(request):
    orgas = Organization.objects.all()
    return render(request, 'index.html',{'orgas': orgas})



def orgs(request):
    orgas = Organization.objects.all()
    return render(request, 'orgas.html', {'orgas': orgas})


def my_space(request):
    return render(request, 'space.html')


def events(request):
    fights = Fight.objects.order_by('event')
    past_events = Event.objects.filter(date_time__lt = datetime.now()).order_by('-date_time')
    upcoming_events = Event.objects.filter(date_time__gte=datetime.now()).order_by('date_time')
    return render(request, 'events.html', {'upcoming_events': upcoming_events, 'past_events': past_events, 'fights':fights})

def event(request, pk):
    event = Event.objects.get(id=pk)
    fights = Fight.objects.filter(event=event)
    return render(request, 'event.html', {'event':event,'fights':fights})


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
        predictions = Prediction.objects.filter(user_id= pk)
        fights = Fight.objects.all()
        total = 0
        accruate = 0
        pending = 0
        for prediction in predictions:
            if prediction.fight.result != 0:
                total += 1
                if prediction.fight.result == prediction.winner:
                    accruate += 1
            else:
                pending += 1
        percentage = round((accruate/total)*100,2)



        
        return render(request, 'profile.html', {'profile': profile,'percentage':percentage,'total':total,'pending':pending,'predictions':predictions, 'fights':fights})
    else: 
        messages.success(request, "You must be logged in.")
        return redirect('home')

#def discussion(request):
#    if request.user.is_authenticated:
#        form = PubliForm(request.POST or None)
#        if request.method == 'POST':
#            if form.is_valid():
#                publi = form.save(commit=False)
#                publi.user = request.user
#                publi.save()
#                messages.success(request, ("Message published"))
#                return redirect('discussion')

#       publications = Publication.objects.all().order_by("-created_time")
#        return render(request, 'discussion.html', {'publications':publications, "form":form})
#    else:
#        publications = Publication.objects.all().order_by("-created_time")
#        return render(request, 'discussion.html', {'publications':publications})
    

def login_v(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, ("You have been logged in. Enjoy!"))
            return redirect('home')
        else:
            messages.success(request, ("Username or password incorrect"))
            return redirect('login')
    else:
        return render(request, 'login.html')
    
def logout_v(request):
    logout(request)
    messages.success(request, ("You have been logged out."))
    return redirect('home')

def register_v(request):
    form = SignUpForm
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            fav_org = form.cleaned_data['favorite_org']
            fav_fighter = form.cleaned_data['favorite_fighter']
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user= authenticate(username=username, password= password)
            profile = Profile(user= user, fav_org=fav_org, fav_fighter=fav_fighter)
            profile.save()
            messages.success(request, 'You are now registered')
            return redirect('home')
        else:
            messages.success(request, 'Registration failed')
            return render(request, 'register.html', {'form': form})
    return render(request, 'register.html', {'form': form})

def profile_update(request):
    if request.user.is_authenticated:
        user = User.objects.filter(id = request.user.id).first()
        form = SignUpForm(request.POST or None, instance = user)
        if request.method == 'POST':
            if form.is_valid():
                form.save()
                login(request, user)
                messages.success(request, ("Profile Updated Successfully"))
                return redirect('home')
            else:
                messages.success(request, 'Failed Update')
                return render(request, 'profile_update.html', {'form': form})
        else:
            return render(request, 'profile_update.html', {'form': form})
    else:
        messages.success(request, ("You need to log in"))
        return redirect('home')

def predict(request):
    form = PredictionForm(request.POST)
    if form.is_valid():
        prediction = form.save(commit=False)
        prediction.user = request.user
        try:
            prediction.save()
            messages.success(request, ("Prediction saved !"))
        except:
            messages.success(request, ("You already predicted this fight"))
    
    return render(request, 'predict.html', {'form': form})
