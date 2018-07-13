from django.test import TestCase, Client
from django.contrib.auth.models import Group
from django.urls import reverse, include, path
from rest_framework.test import APITestCase, APIRequestFactory, APIClient
from rest_framework import status

from chronocard.models import User

# Create your tests here.

class ChronocardTest(APITestCase):

    def setUp(self):
        self.factory = APIRequestFactory()
        self.regular_user = User.objects.create_user(username='test_user', email='test_user@testpass.com',
                                              password='testpass', handle='TestUser')
        self.deputy_user = User.objects.create_user(username='test_deputy', email='test_deputy@testpass.com',
                                              password='testdeputypass', handle='TestDeputy')
        deputy_group = Group.objects.get(name='deputies')
        self.deputy_user.groups.add(deputy_group)
        self.user_client = APIClient()
        self.user_client.login(username=self.regular_user.username, password=self.regular_user.password)


    def test_something(self):
        url = '/api/user'
        response = self.user_client.get(url)
        print(response.body)
        self.assertEqual(response.status_code, status.HTTP_200_OK)