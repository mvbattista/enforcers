from rest_framework import authentication, viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser


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
        IsAuthenticated,
        # permissions.IsAdminUser,
    )

    paginate_by = 25
    paginate_by_param = 'page_size'
    max_paginate_by = 100

    action_permissions = {
        IsAdminUser: ['create', 'update', 'partial_update', 'destroy'],
        IsAuthenticated: ['list', 'retrieve']
    }


class EventViewSet(DefaultsMixin, viewsets.ModelViewSet):
    queryset = Event.objects.order_by('start_date')
    serializer_class = EventSerializer
    base_name = 'event-list'

class UserViewSet(viewsets.ViewSet):
    """
    Example empty viewset demonstrating the standard
    actions that will be handled by a router class.

    If you're using format suffixes, make sure to also include
    the `format=None` keyword argument for each action.
    """

    def list(self, request):
        pass

    def create(self, request):
        pass

    def retrieve(self, request, pk=None):
        pass

    def update(self, request, pk=None):
        pass

    def partial_update(self, request, pk=None):
        pass

    def destroy(self, request, pk=None):
        pass