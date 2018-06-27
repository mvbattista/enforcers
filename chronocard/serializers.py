from rest_framework.serializers import ModelSerializer, DurationField, BooleanField, ReadOnlyField
from .models import Event, EventUser, Checkin, EventShift, User


class EventSerializer(ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class UserSerializer(ModelSerializer):
    is_deputy = BooleanField(read_only=True)
    class Meta:
        model = User
        fields = ('id', 'username', 'first_name', 'last_name', 'email', 'is_staff', 'is_deputy', 'handle')


class EventUserSerializer(ModelSerializer):
    handle = ReadOnlyField(source='user.handle')

    class Meta:
        model = EventUser
        fields = ('id', 'event', 'user', 'handle', 'badge_id', )


class CheckInSerializer(ModelSerializer):
    total_time = DurationField(read_only=True)

    class Meta:
        model = Checkin
        fields = ('id', 'event_user', 'start_date', 'end_date', 'total_time')


class EventShiftSerializer(ModelSerializer):
    class Meta:
        model = EventShift
        fields = '__all__'
