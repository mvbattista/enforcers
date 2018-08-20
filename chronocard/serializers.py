import pytz

from rest_framework.serializers import (Serializer, ModelSerializer, ValidationError, BooleanField, ReadOnlyField, DurationField, IntegerField, Field)
from django.core.validators import ValidationError as DjangoValidationError
from .models import Event, EventUser, Checkin, EventShift, User


class TimezoneField(Field):
    def to_representation(self, obj):
        return str(obj)

    def to_internal_value(self, data):
        try:
            return pytz.timezone(str(data))
        except pytz.exceptions.UnknownTimeZoneError:
            raise ValidationError('Unknown timezone')


class EventSerializer(ModelSerializer):
    time_zone = TimezoneField()

    def validate(self, data):
        instance = Event(**data)
        try:
            instance.clean()
        except DjangoValidationError as e:
            raise ValidationError(e.args[0])

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
        instance = Checkin(**data)
        try:
            instance.clean()
        except DjangoValidationError as e:
            raise ValidationError(e.args[0])
        # This can't edit an open check-in then.
        # if data.get('end_date') is None and Checkin.objects.filter(event_user_id=data['event_user'], end_date=None)\
        #         .exists():
        #     raise ValidationError('Cannot have more than one check-in open per user.')
        # if Checkin.objects.filter(start_date__gte=data['start_date'], end_date__lte=data['start_date'])\
        #         .exclude(id=data.get('id')).exists():
        #     raise ValidationError('Start date is in another check-in period')

    # def create(self, validated_data):
    #     if validated_data.get('end_date') is None and Checkin.objects.filter(event_user_id=validated_data['event_user'],
    #                                                                          end_date=None).exists():
    #         raise ValidationError('Cannot have more than one check-in open per user.')


    class Meta:
        model = Checkin
        fields = ('id', 'event_user', 'start_date', 'end_date', 'total_time')


class EventShiftSerializer(ModelSerializer):
    class Meta:
        model = EventShift
        fields = '__all__'

class CheckInManualSerializer(Serializer):
    id = IntegerField()