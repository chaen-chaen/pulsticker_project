from django.shortcuts import render
from django.http import JsonResponse
from .models import Pulsticker

def pulsticker_list(request):
    pulstickers = Pulsticker.objects.all().order_by('-created_at')
    data = []
    for pulsticker in pulstickers:
        data.append({
            'id': pulsticker.id,
            'title': pulsticker.title,
            'content': pulsticker.content,
            'created_at': pulsticker.created_at.strftime('%Y-%m-%d %H:%M:%S'),
        })
    return JsonResponse(data, safe=False)