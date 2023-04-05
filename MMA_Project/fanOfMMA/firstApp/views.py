from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import HttpResponse
from .models import Profile, Organization, Publication
from .forms import PubliForm, SignUpForm
from django.contrib.auth import authenticate, login, logout
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
        publications = Publication.objects.filter(user_id= pk)
        return render(request, 'profile.html', {'profile': profile, 'publications':publications})
    else: 
        messages.success(request, "You must be logged in.")
        return redirect('home')

def discussion(request):
    if request.user.is_authenticated:
        form = PubliForm(request.POST or None)
        if request.method == 'POST':
            if form.is_valid():
                publi = form.save(commit=False)
                publi.user = request.user
                publi.save()
                messages.success(request, ("Message published"))
                return redirect('discussion')

        publications = Publication.objects.all().order_by("-created_time")
        return render(request, 'discussion.html', {'publications':publications, "form":form})
    else:
        publications = Publication.objects.all().order_by("-created_time")
        return render(request, 'discussion.html', {'publications':publications})
    

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