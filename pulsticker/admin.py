from django.contrib import admin
from .models import Pulsticker

class PulstickerAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'created_at')
