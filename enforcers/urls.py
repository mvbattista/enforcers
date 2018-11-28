"""enforcers URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
# from django.conf.urls import url
from django.views.generic.base import TemplateView, RedirectView
from django.contrib.staticfiles.storage import staticfiles_storage

from django.contrib.auth import views as auth_views

# from . import forms

from chronocard.urls import router as chronocard_router

from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    # url(r'^$', TemplateView.as_view(template_name="base.html"), name='index')
    path('', TemplateView.as_view(template_name='index.html'), name='index'),
    path('admin/', admin.site.urls),
    path('api/token', obtain_auth_token, name='api-token'),
    path('api/', include(chronocard_router.urls)),
    path('', include('django.contrib.auth.urls')),
    # path('login/', auth_views.LoginView.as_view(), name='login'),
    # path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('favicon.ico', RedirectView.as_view( url=staticfiles_storage.url('favicon.ico'), ), name="favicon"),
]
