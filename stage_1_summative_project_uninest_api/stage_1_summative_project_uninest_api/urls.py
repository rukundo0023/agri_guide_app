from django.contrib import admin
from django.urls import path, include
from residence.views import home

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('residence.urls')),
    path('', home, name='home'),  # Home page view
    
    



    
]
