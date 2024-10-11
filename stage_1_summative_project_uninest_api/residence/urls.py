from django.urls import path
from .views import BuildingListCreate, RoomListCreate, ResidentListCreate
from .views import LoginView, LogoutView 

urlpatterns = [
    path('buildings/', BuildingListCreate.as_view(), name='building-list'),
    path('rooms/', RoomListCreate.as_view(), name='room-list'),
    path('residents/', ResidentListCreate.as_view(), name='resident-list'),
    path('login/', LoginView.as_view(), name='login'),  # Map to LoginView
    path('logout/', LogoutView.as_view(), name='logout'),  # Map to LogoutView
]
