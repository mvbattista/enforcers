from django.test import TestCase, Client
from django.contrib.auth.models import Group
from django.urls import reverse, include, path
from rest_framework.test import APITestCase, APIRequestFactory, URLPatternsTestCase
from rest_framework import status

from chronocard.models import User

# Create your tests here.

class ChronocardTest(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('enforcers.urls')),
    ]

    def setUp(self):
        self.factory = APIRequestFactory()
        self.regular_user = User.objects.create_user(username='test_user', email='test_user@testpass.com',
                                              password='test_pass', handle='TestUser')
        self.deputy_user = User.objects.create_user(username='test_deputy', email='test_deputy@testpass.com',
                                              password='test_deputy', handle='TestDeputy')
        deputy_group = Group.objects.get(name='deputies')
        self.deputy_user.groups.add(deputy_group)

    def test_something(self):
        url = reverse('user')
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)