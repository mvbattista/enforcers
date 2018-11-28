from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter(trailing_slash=False)
router.register(r'event', views.EventViewSet)
router.register(r'check_in', views.CheckInViewSet)
router.register(r'user', views.UserViewSet)
router.register(r'event_user', views.EventUserViewSet)
router.register(r'event_shift', views.EventShiftViewSet)
router.register(r'location', views.LocationViewSet)

# TODO:
# user POST (admin), PUT, GET,
# event_user POST(A), PUT(A), GET
# check_in POST, PUT (Staff/Admin), GET
# event_shift GET, POST (A), PUT (A)
