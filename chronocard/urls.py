from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter(trailing_slash=False)
router.register(r'event', views.EventViewSet)

# TODO:
# user POST (admin), PUT, GET,
# event_user POST(A), PUT(A), GET
# check_in POST, PUT (Staff/Admin), GET
# event_shift GET, POST (A), PUT (A)
