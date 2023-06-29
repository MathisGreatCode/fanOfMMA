from django.contrib import admin
from .models import Fighter, Organization, Profile,  Event, Fight, Category
from django.contrib.auth.models import User

# Register your models here.
# admin.site.register()
admin.site.register(Fighter)
admin.site.register(Organization)

#make the Profile appear within User and not as separated model
class ProfileInline(admin.StackedInline):
    model = Profile

class UserAdmin(admin.ModelAdmin):
    model = User
    fields = ["username"]
    inlines = [ProfileInline]

#unregister + register to save the changes
admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Event)
admin.site.register(Fight)
admin.site.register(Category)