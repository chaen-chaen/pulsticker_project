from django.contrib import admin
from .models import Ticker, Tag, News

admin.site.register(Ticker)
admin.site.register(Tag)
admin.site.register(News)
