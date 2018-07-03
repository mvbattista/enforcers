from rest_framework.serializers import (Serializer, ModelSerializer, ValidationError, BooleanField, ReadOnlyField, DurationField, IntegerField)
from .models import Event, EventUser, Checkin, EventShift, User


class EventSerializer(ModelSerializer):

    def validate(self, data):
        if data['start_date'] < data['work_start_date']:
            raise ValidationError('Cannot have work_start_date after start_date')
        if data['end_date'] < data['start_date']:
            raise ValidationError('Cannot have start_date after end_date')
        if data['work_end_date'] < data['end_date']:
            raise ValidationError('Cannot have end_date after work_end_date')

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

    def validate(self, data):
        if data.get('end_date') is None and Checkin.objects.filter(event_user_id=data['event_user'], end_date=None)\
                .exists():
            raise ValidationError('Cannot have more than one check-in open per user.')
        if Checkin.objects.filter(start_date__gte=data['start_date'], end_date__lte=data['start_date'])\
                .exclude(id=data.get('id')).exists():
            raise ValidationError('Start date is in another check-in period')

    class Meta:
        model = Checkin
        fields = ('id', 'event_user', 'start_date', 'end_date', 'total_time')


class EventShiftSerializer(ModelSerializer):
    class Meta:
        model = EventShift
        fields = '__all__'

class CheckInManualSerializer(Serializer):
    id = IntegerField()