from datetime import timedelta

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import ValidationError

# Create your models here.
class User(AbstractUser):
    handle = models.CharField(max_length=30, blank=True)

    @property
    def is_deputy(self):
        return True if self.groups.get(name='deputies') else False

class Event(models.Model):
    name = models.CharField(max_length=32)
    start_date = models.DateField()
    end_date = models.DateField()
    work_start_date = models.DateField()
    work_end_date = models.DateField()

    def __str__(self):
        return '{} ({} - {})'.format(self.name, self.start_date, self.end_date)

    def clean(self, *args, **kwargs):
        super(Event, self).clean(*args, **kwargs)
        if self.start_date < self.work_start_date:
            raise ValidationError('Cannot have work_start_date after start_date')
        if self.end_date < self.start_date:
            raise ValidationError('Cannot have start_date after end_date')
        if self.work_end_date < self.end_date:
            raise ValidationError('Cannot have end_date after work_end_date')


    def save(self, *args, **kwargs):
        self.full_clean()
        super(Event, self).save(*args, **kwargs)



class EventUser(models.Model):
    event = models.ForeignKey('Event', on_delete=models.DO_NOTHING, null=False, blank=False)
    user = models.ForeignKey('User', on_delete=models.DO_NOTHING, null=False, blank=False)
    # total_time = models.FloatField(default=0)
    badge_id = models.CharField(max_length=16, null=False)

    @property
    def total_time(self):
        all_check_ins = [x.total_time for x in self.checkin_set.all() if x.total_time]
        return sum(all_check_ins, timedelta())


class Location(models.Model):
    event = models.ForeignKey('Event', on_delete=models.DO_NOTHING, null=False, blank=False)
    description = models.CharField(max_length=64, null=False)
    location = models.CharField(max_length=64)
    instruction = models.TextField()

class EventShift(models.Model):
    event = models.ForeignKey('Event', on_delete=models.DO_NOTHING, null=False, blank=False)
    location = models.ForeignKey('Location', on_delete=models.DO_NOTHING, null=False, blank=False)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()

class Checkin(models.Model):
    event_user = models.ForeignKey('EventUser', on_delete=models.DO_NOTHING, null=False, blank=False)
    start_date = models.DateTimeField(null=False)
    end_date = models.DateTimeField(null=True, blank=True)

    # Budget Flight time validation logic:
    # Ns = New Start Date
    # Ne = New End Date
    # Xs = Existing Start Date
    # Xe = Existing End Date
    # Ms = Modifying Start Date (Ns on a Xs)
    # Me = Modifying End Date (Ne on a Xe)

    # Good criteria:
    # Ns < Ne
    # Ns < Xs && Ne <= Xs
    # Ns >= Xe && Ne > Xe
    # Ms > now || Ms == Xs
    # Me > now

    # Bad cases:
    # Ns >= Ne                Start date after or equal to end date
    # Ns == Xs && Ne == Xe    Exact copy of an existing budget flight
    # Ns == Xs                New flight cannot share same starting point of an existing flight
    # Ne == Xe                New flight cannot share tsame ending point of an existing flight
    # Ns > Xs && Ne < Xe      New flight is within the span of an existing flight
    # Ns < Xs && Ns > Xe      New flight encompasses the span of an existing flight
    # Ns < Xs && Ne > Xs      New flight starts in the span of an existing flight
    # Ns < Xe && Ne > Xe      New flight ends in the span of an existing flight
    # Ms != Xs && Ms <= now   Modified start date (if modified) cannot be in the past
    # Me < now

    def clean(self, *args, **kwargs):
        super(Checkin, self).clean(*args, **kwargs)
        if self.start_date and self.end_date is None and Checkin.objects.filter(event_user_id=self.event_user_id, end_date=None).count() == 1:
            raise ValidationError('Cannot have more than one check-in open per user.')
        if self.end_date and self.start_date and self.end_date < self.start_date:
            raise ValidationError('Cannot have start_date after end_date')

    def save(self, *args, **kwargs):
        self.full_clean()
        super(Checkin, self).save(*args, **kwargs)

    @property
    def total_time(self):
        if not self.end_date:
            return None
        else:
            return self.end_date - self.start_date
