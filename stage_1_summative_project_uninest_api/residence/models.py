from django.db import models

class Building(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    capacity = models.PositiveIntegerField()  # Ensure this is set correctly based on your application needs
    current_occupancy = models.PositiveIntegerField(default=0)
    floors = models.PositiveIntegerField()

    def __str__(self):
        return self.name

class Room(models.Model):
    building = models.ForeignKey(Building, on_delete=models.CASCADE)
    room_number = models.CharField(max_length=10)
    room_type = models.CharField(max_length=50, choices=[('Single', 'Single'), ('Double', 'Double')])
    status = models.CharField(max_length=20, choices=[('Occupied', 'Occupied'), ('Available', 'Available')])
    occupant = models.ForeignKey('Resident', null=True, blank=True, on_delete=models.SET_NULL, related_name='occupied_rooms')

    def __str__(self):
        return f"{self.room_number} - {self.building.name}"

class Resident(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    room = models.ForeignKey(Room, on_delete=models.SET_NULL, null=True, related_name='residents')

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
