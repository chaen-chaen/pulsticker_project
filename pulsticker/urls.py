from django.urls import path
from .views import pulsticker_list

urlpatterns = [
    path('pulstickers/', pulsticker_list, name='pulsticker_list'),
]

