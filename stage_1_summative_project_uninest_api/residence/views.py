from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from django.views.decorators.cache import cache_page
from .permissions import IsAdministrator
from .models import Building, Room, Resident
from .serializers import BuildingSerializer, RoomSerializer, ResidentSerializer


# Home View
def home(request):
    return HttpResponse("<h1>Welcome to the UniNest API!</h1>")


# Building Views
class BuildingListCreate(generics.ListCreateAPIView):
    queryset = Building.objects.all()
    serializer_class = BuildingSerializer
    permission_classes = [IsAdministrator]  # Restrict access to administrators


@cache_page(60 * 15)  # Cache for 15 minutes
class CachedBuildingListCreate(generics.ListCreateAPIView):
    queryset = Building.objects.all()
    serializer_class = BuildingSerializer


class BuildingDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Building.objects.all()
    serializer_class = BuildingSerializer
    permission_classes = [IsAdministrator]  # Restrict access to administrators


# Room Views
class RoomListCreate(generics.ListCreateAPIView):
    queryset = Room.objects.all()
    serializer_class = RoomSerializer


class RoomDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Room.objects.all()
    serializer_class = RoomSerializer


# Resident Views
class ResidentListCreate(generics.ListCreateAPIView):
    queryset = Resident.objects.all()
    serializer_class = ResidentSerializer


class ResidentDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Resident.objects.all()
    serializer_class = ResidentSerializer


# Authentication Views
class LoginView(APIView):
    def post(self, request):
        username = request.data.get("username")
        password = request.data.get("password")
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            return Response({"message": "Login successful!"}, status=status.HTTP_200_OK)
        return Response({"error": "Invalid credentials"}, status=status.HTTP_400_BAD_REQUEST)


class LogoutView(APIView):
    def post(self, request):
        logout(request)
        return Response({"message": "Logout successful!"}, status=status.HTTP_200_OK)

