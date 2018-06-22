from rest_framework.permissions import BasePermission
from django.contrib.auth.models import Group

class GroupBasePermission(BasePermission):
    group_name = ''

    def has_permission(self, request, view):
        if request.user.is_superuser:
            return True
        try:
            request.user.groups.get(name=self.group_name)
        except Group.DoesNotExist:
            return False
        return True

class IsDeputy(GroupBasePermission):
    group_name = 'deputies'
