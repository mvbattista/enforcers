from rest_framework.serializers import ModelSerializer
# from rest_framework.permissions import IsAdminUser
from .models import Event, EventUser, Checkin, EventShift, User


class EventSerializer(ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'first_name', 'last_name', 'email', 'is_staff', 'is_deputy', 'handle')

    def get_is_deputy(self, obj):
        return obj.is_deputy


class EventUserSerializer(ModelSerializer):
    class Meta:
        model = EventUser
        fields = '__all__'


class CheckInSerializer(ModelSerializer):
    class Meta:
        model = Checkin
        fields = '__all__'


class EventShiftSerializer(ModelSerializer):
    class Meta:
        model = EventShift
        fields = '__all__'
