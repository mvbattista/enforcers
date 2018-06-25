from django.contrib import admin
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.forms import UserChangeForm, UserCreationForm
from django.contrib.auth.admin import UserAdmin
from .models import User, Event, EventShift, Location, EventUser, Checkin

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


class CheckinInline(admin.TabularInline):
    model = Checkin
    # list_display = ('start_date', 'end_date', 'total_time')
    fields = ('start_date', 'end_date', 'total_time')
    readonly_fields = ['total_time',]

class EnforcerEventUserAdmin(admin.ModelAdmin):
    list_display = ('id', 'get_user_handle', 'get_event_name', 'badge_id',)
    inlines = [CheckinInline,]
    # fields = ['event', 'user', 'badge_id', 'total_time']
    readonly_fields = ['total_time', ]

    def get_user_handle(self, obj):
        return obj.user.handle

    def get_event_name(self, obj):
        return obj.event.name

    get_user_handle.admin_order_field = 'user'
    get_user_handle.short_description = 'User Handle'
    get_event_name.admin_order_field = 'event'
    get_event_name.short_description = 'Event'

admin.site.register(User, EnforcerUserAdmin)
admin.site.register(EventUser, EnforcerEventUserAdmin)
admin.site.register(Location)
admin.site.register(Event)
admin.site.register(EventShift)