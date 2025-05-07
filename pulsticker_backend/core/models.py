from django.db import models

class Ticker(models.Model):
    name = models.CharField(max_length=100)
    symbol = models.CharField(max_length=20)

    def __str__(self):
        return f"{self.name} ({self.symbol})"
    
class Tag(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return self.name
    
class News(models.Model):
    ticker = models.ForeignKey(Ticker, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    summary = models.TextField()
    source_url = models.URLField()
    date = models.DateField()
    tags = models.ManyToManyField(Tag, blank=True)

    def __str__(self):
        return f"[{self.date}] {self.title}"
