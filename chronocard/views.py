from django.core.validators import ValidationError as DjangoValidationError
from rest_framework import authentication, viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser, DjangoModelPermissions, DjangoObjectPermissions
from rest_framework.serializers import ValidationError
from django_filters.rest_framework import DjangoFilterBackend

from .models import Event, Checkin, User, EventUser
from .serializers import EventSerializer, CheckInSerializer, UserSerializer, EventUserSerializer
from .permissions import IsDeputy

# Create your views here.

class DefaultsMixin(object):
    # Default settings for views

    authentication_classes = (
        authentication.BasicAuthentication,
        authentication.TokenAuthentication,
    )

    # permission_classes = (
    #     IsAuthenticated,
    #     IsAdminUser,
    # )
    # permission_classes = (DjangoModelPermissions,)

    paginate_by = 25
    paginate_by_param = 'page_size'
    max_paginate_by = 100
    filter_backends = (DjangoFilterBackend,)
    filter_fields = '__all__'

    action_permissions = {
        IsAdminUser: ['create', 'update', 'partial_update', 'destroy'],
        IsAuthenticated: ['list', 'retrieve']
    }


class EventViewSet(DefaultsMixin, viewsets.ModelViewSet):
    queryset = Event.objects.order_by('start_date')
    serializer_class = EventSerializer
    filter_fields = ('name', 'start_date', 'end_date', 'work_start_date', 'work_end_date')
    # base_name = 'event-list'


# class CheckInViewSet(DefaultsMixin, viewsets.ModelViewSet):
#     action_permissions = {
#         IsDeputy: ['create', 'update', 'partial_update', 'destroy'],
#         IsAuthenticated: ['list', 'retrieve']
#     }

class CheckInViewSet(DefaultsMixin, viewsets.ModelViewSet):
    queryset = Checkin.objects.order_by('start_date')
    serializer_class = CheckInSerializer
    permission_classes = (DjangoModelPermissions,)

    # def perform_update(self, serializer):
    #     try:
    #         instance = serializer.save()
    #     except DjangoValidationError as detail:
    #         msg = "%s" % detail
    #         raise ValidationError(msg)
    #
    # def perform_create(self, serializer):
    #     try:
    #         instance = serializer.save()
    #     except DjangoValidationError as detail:
    #         msg = "%s" % detail
    #         raise ValidationError(msg)
    #
    # def perform_destroy(self, instance):
    #     instance.delete()

class UserViewSet(DefaultsMixin, viewsets.ModelViewSet):
    queryset = User.objects.order_by('handle')
    serializer_class = UserSerializer
    permission_classes = (DjangoObjectPermissions,)

class EventUserViewSet(DefaultsMixin, viewsets.ModelViewSet):
    queryset = EventUser.objects.order_by('user__handle')
    serializer_class = EventUserSerializer
    permission_classes = (DjangoModelPermissions,)


# class UserViewSet(viewsets.ViewSet):
#     """
#     Example empty viewset demonstrating the standard
#     actions that will be handled by a router class.
#
#     If you're using format suffixes, make sure to also include
#     the `format=None` keyword argument for each action.
#     """
#
#     def list(self, request):
#         pass
#
#     def create(self, request):
#         pass
#
#     def retrieve(self, request, pk=None):
#         pass
#
#     def update(self, request, pk=None):
#         pass
#
#     def partial_update(self, request, pk=None):
#         pass
#
#     def destroy(self, request, pk=None):
#         pass

