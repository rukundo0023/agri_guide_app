from rest_framework.permissions import BasePermission

class IsAdministrator(BasePermission):
    """
    Custom permission to only allow administrators to access a view.
    """
    def has_permission(self, request, view):
        return request.user and request.user.is_staff
