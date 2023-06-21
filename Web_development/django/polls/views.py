from django.shortcuts import render,get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views.generic.list import ListView
from .models import Question, Choice

def index(request): # 첫페이지
    # objects 호출 객체 all: select * from Question , -pub_date : 날짜의 역순으로
    latest_question_list = Question.objects.all().order_by('-pub_date')[:5]
    # dict 형식으로 데이터를 넘김
    context={'latest_question_list' : latest_question_list}
    return render(request,'polls/index.html', context)

def detail(request, question_id):
    question=get_object_or_404(Question, pk=question_id)
    # web 404에러는 데이터가 없다는 의미
    return render(request,'polls/detail.html',{'question': question})

def results(request, question_id):
    question=get_object_or_404(Question, pk=question_id)
    return render(request,'polls/results.html',{'question': question})

def vote(request, question_id):
    p=get_object_or_404(Question, pk=question_id)
    try: # 클라이언트에서 선택한 번호
        selected_choice = p.choice_set.get(pk=request.POST['choice'])
    except (KeyError,Choice.DoesNotExist):
        return render(request,'polls/detail.html',{
            'question': p, 'error_message':"선택하지 않았습니다.",
        })
    else:
        selected_choice.votes += 1 # 선택에 회수추가
        selected_choice.save() # update (데이터 베이스에 저장
        # 보안 때문에 reverse('polls:results' 이런 식으로 사용함
        return HttpResponseRedirect(reverse('polls:results',args=(p.id,)))
# Create your views here.
