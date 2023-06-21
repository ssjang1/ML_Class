from django.shortcuts import render
from .models import Score
from django.http import HttpResponse

def score_list(request):
    scores = Score.objects.all()
    context = {'scores': scores}
    return render(request, 'score/score_list.html', context)
# Create your views here.
