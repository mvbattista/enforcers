from django.test import TestCase, Client
import django
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", 'enforcers.settings')
django.setup()

from django.conf import settings
from django.contrib.auth.models import Group
from django.urls import reverse, include, path
from rest_framework.test import APITestCase, APIRequestFactory, APIClient
from rest_framework import status
import pytest

from chronocard.models import User

# Create your tests here.

class ChronocardTestCase(APITestCase):

    def setUp(self):
        self.factory = APIRequestFactory()
        self.regular_user = User.objects.create_user(username='test_user', email='test_user@testpass.com',
                                                        password='testpass', handle='TestUser')
        self.deputy_user = User.objects.create_user(username='test_deputy', email='test_deputy@testpass.com',
                                                       password='testdeputypass', handle='TestDeputy')
        self.admin_user = User.objects.create_superuser(username='test_admin', email='test_admin@testpass.com',
                                                        password='testpass', handle='TestAdmin')
        deputy_group = Group.objects.get(name='deputies')
        self.deputy_user.groups.add(deputy_group)
        self.user_client = APIClient()
        self.user_client.force_authenticate(self.regular_user)
        self.deputy_client = APIClient()
        self.deputy_client.force_authenticate(self.deputy_user)
        self.admin_client = APIClient()
        self.admin_client.force_authenticate(self.admin_user)

    def test_users(self):
        url = '/api/user'
        response = self.user_client.get(url)
        result = response.json()
        # self.assertEqual(response.status_code, status.HTTP_200_OK)
        assert response.status_code == status.HTTP_200_OK
        assert len(result) == 3
        # TODO - Create User from self-service registration
        # print('Users')

    def test_event_users(self):
        url = '/api/event_user'
        response = self.user_client.get(url)
        result = response.json()
        # print(response.body)
        # self.assertEqual(response.status_code, status.HTTP_200_OK)
        assert response.status_code == status.HTTP_200_OK
        assert len(result) == 0
        # TODO - Deputy/Admin can create event users, regular users cannot.
        # print('Event Users')

    # TODO - Only admins can create and edit events
    # TODO - Check event dates logic

    # TODO - Check-in logic on times
    # TODO - Permission to create/edit only for deputy/admin

    # TODO - Event shift
    # TODO - Locations



