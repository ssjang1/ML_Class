from django.db import models

class Score(models.Model):
    name = models.CharField(max_length=10)
    kor = models.IntegerField()
    mat = models.IntegerField()
    eng = models.IntegerField()

    def __str__(self):
        return self.name

# Create your models here.
