from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import ValidationError

# Create your models here.
class User(AbstractUser):
    handle = models.CharField(max_length=30, blank=True)

class Event(models.Model):
    name = models.CharField(max_length=32)
    start_date = models.DateField()
    end_date = models.DateField()
    work_start_date = models.DateField()
    work_end_date = models.DateField()

    def clean(self, *args, **kwargs):
        super(Event, self).clean(*args, **kwargs)
        if self.end_date < self.start_date:
            raise ValidationError('Cannot have start_date after end_date')
        if self.work_end_date < self.work_start_date:
            raise ValidationError('Cannot have work_start_date after work_end_date')
        if self.work_start_date > self.start_date:
            raise ValidationError('Cannot have work_start_date after start_date')
        if self.work_end_date < self.end_date:
            raise ValidationError('Cannot have work_end_date before end_date')

    def save(self, *args, **kwargs):
        self.full_clean()
        super(Event, self).save(*args, **kwargs)


class EventUser(models.Model):
    event = models.ForeignKey('Event', on_delete=models.DO_NOTHING, null=False, blank=False)
    user = models.ForeignKey('User', on_delete=models.DO_NOTHING, null=False, blank=False)
    total_time = models.FloatField(default=0)
    badge_id = models.CharField(max_length=16, null=False)

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
    end_date = models.DateTimeField(null=True)