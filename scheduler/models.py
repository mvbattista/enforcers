from django.db import models

# Create your models here.
class PAXEvent(models.Model):
    name = models.CharField(max_length=64)
    start_date = models.DateField()
    end_date = models.DateField()

class Enforcer(models.Model):
    handle = models.CharField(max_length=64)

class EventDay(models.Model):
    event = models.ForeignKey(PAXEvent, on_delete=models.DO_NOTHING)
    date = models.DateField()
    closing_time = models.TimeField()

class ShiftPeriod(models.Model):
    event = models.ForeignKey(PAXEvent, on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=32) # Morning, Mid, Late

class DayShift(models.Model):
    day = models.ForeignKey(EventDay, on_delete=models.DO_NOTHING,)
    shift_period = models.ForeignKey(ShiftPeriod, on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=32)

class Department(models.Model):
    event = models.ForeignKey(PAXEvent, on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=64)
    manager = models.CharField(max_length=128)
    location = models.CharField(max_length=64)
    is_special = models.BooleanField(default=False)

class Supervisor(models.Model):
    department = models.ForeignKey(Department, on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=64)
    title = models.CharField(max_length=64, null=True)
    ordering = models.IntegerField()

class DepartmentShift(models.Model):
    day_shift = models.ForeignKey(DayShift, on_delete=models.DO_NOTHING)
    department = models.ForeignKey(Department, on_delete=models.DO_NOTHING)
    start_time = models.TimeField()
    end_time = models.TimeField()

class RecurringAssignment(models.Model):
    assignee = models.ForeignKey(Enforcer, on_delete=models.DO_NOTHING)
    department = models.ForeignKey(Department, on_delete=models.DO_NOTHING)
    shift_period = models.ForeignKey(ShiftPeriod, on_delete=models.DO_NOTHING, null=True)
    # Can be null if department.is_special = True

class IrregularAssignment(models.Model):
    assignee = models.ForeignKey(Enforcer, on_delete=models.DO_NOTHING)
    department_shift = models.ForeignKey(DepartmentShift, on_delete=models.DO_NOTHING)

