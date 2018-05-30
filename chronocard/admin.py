from django.contrib import admin
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.forms import UserChangeForm, UserCreationForm
from django.contrib.auth.admin import UserAdmin
from .models import User, Event, EventShift, Location

# Register your models here.

class EnforcerUserChangeForm(UserChangeForm):
    class Meta(UserChangeForm.Meta):
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'handle')

class EnforcerUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = User
        # fields = ('username', 'first_name', 'last_name', 'email', 'handle')

class EnforcerUserAdmin(UserAdmin):
    add_form = EnforcerUserCreationForm
    form = EnforcerUserChangeForm
    list_display = ('id', 'handle', 'first_name', 'last_name', 'email', 'username')
    # fields = ('id', 'handle', 'first_name', 'last_name', 'email')
    fieldsets = (
        (_('Personal info'), {'fields': ('first_name', 'last_name', 'email', 'handle')}),
        (None, {'fields': ('username', 'password')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       # 'groups', 'user_permissions'
                                       )}),
        # (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'handle', 'first_name', 'last_name', 'email', 'password1', 'password2'),
        }),
    )

admin.site.register(User, EnforcerUserAdmin)
admin.site.register(Location)
admin.site.register(Event)
admin.site.register(EventShift)