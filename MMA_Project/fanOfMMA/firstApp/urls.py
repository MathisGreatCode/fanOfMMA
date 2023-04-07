from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("MMA/", views.about_mma, name="MMA"),
    path("organizations/", views.orgs, name="orgs"),
    path("organizations/<int:pk>", views.org),
    path("profile/<int:pk>", views.profile, name="profile"),
    path("events/", views.events, name="events"),
    path('profile_list/', views.profile_list, name="profile_list"),
    path("discussion/", views.discussion, name="discussion"),
    path("login/", views.login_v, name= "login"),
    path("logout/", views.logout_v, name="logout"),
    path("register/", views.register_v, name="register"),
]
