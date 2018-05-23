from django.shortcuts import render
from rest_framework import authentication, permissions, viewsets

from .models import Event
from .serializers import EventSerializer

# Create your views here.

class DefaultsMixin(object):
    # Default settings for views

    authentication_classes = (
        authentication.BasicAuthentication,
        authentication.TokenAuthentication,
    )

    permission_classes = (
        permissions.IsAuthenticated,
        # permissions.IsAdminUser,
    )

    paginate_by = 25
    paginate_by_param = 'page_size'
    max_paginate_by = 100

class EventViewSet(DefaultsMixin, viewsets.ModelViewSet):
    queryset = Event.objects.order_by('start_date')
    serializer_class = EventSerializer