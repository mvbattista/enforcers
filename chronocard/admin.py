from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Event, EventShift, Location

# Register your models here.
admin.site.register(User, UserAdmin)
admin.site.register(Location)
admin.site.register(Event)
admin.site.register(EventShift)