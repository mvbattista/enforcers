from rest_framework.serializers import ModelSerializer
# from rest_framework.permissions import IsAdminUser
from .models import Event, EventUser, Checkin, EventShift, User


class EventSerializer(ModelSerializer):
    class Meta:
        model = Event
        fields = ('id', 'name', 'start_date', 'end_date', 'work_start_date', 'work_end_date', )


class UserSerializer(ModelSerializer):
    class Meta:
        model = User


class EventUserSerializer(ModelSerializer):
    class Meta:
        model = EventUser


class CheckInSerializer(ModelSerializer):
    class Meta:
        model = Checkin


class EventShiftSerializer(ModelSerializer):
    class Meta:
        model = EventShift
