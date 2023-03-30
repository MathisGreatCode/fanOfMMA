from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("MMA/", views.about_mma, name="MMA"),
    path("organizations/", views.orgs, name="orgs"),
    path("organizations/<int:pk>", views.org),
    path("profile/<int:pk>", views.profile, name="profile"),
    path("calendar/", views.calendar, name="calendar"),
    path('profile_list/', views.profile_list, name="profile_list"),
]
