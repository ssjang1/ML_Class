
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic.base import TemplateView
from .forms import NewUserForm
from django.contrib.auth import login
from django.contrib import messages
from sungjukcall.models import Sungjuk
class HomeView(TemplateView):
    template_name = 'home.html'
    def get_context_data(self, **kwargs):
        context = super(HomeView, self).get_context_data(**kwargs)
        return context

# 실시간 이미지 생성
import matplotlib # 시각화 패키지
matplotlib.use('Agg') # canvas에 접근 하는  cache
import matplotlib.pyplot as plt # 출력공간
from django.http import HttpResponse
import numpy as np # 선형대수
import pandas as pd # Dataframe 이질적인 데이터를 담는 그릇
import io # 입출력을 제어
from matplotlib.backends.backend_agg import FigureCanvasAgg
def pandasgraph(request):
    # 이미지 사이즈를 결정, dot per inch 해상도를 결정
    fig=plt.figure(figsize=(6, 4.5), dpi=80, facecolor='w', edgecolor='w')
    ax=fig.add_subplot(111) # 화면을 분할 ( 행, 열 , 해당번호)
    # pandas : 시계열 데이터를 다룸
    f=pd.DataFrame({'y':np.random.randn(10),'z':np.random.randn(10)},
                   index=pd.period_range('1-2000',periods=10))
    f.plot(ax=ax, kind='bar') # 도화지를 생성 -> 바플롯
    buf = io.BytesIO() # 임시버퍼
    canvas = FigureCanvasAgg(fig) # canvas는 웹에서 이미지를 그리는 공간 (vector)
    canvas.print_png(buf)
    fig.clear() # 도화를 정리
    plt.close('all')

    response=HttpResponse(buf.getvalue(), content_type='image/png')
    response['Content-Length'] = str(len(response.content))
    return response

def pandasgraph_call(request):
    return render(request, 'pandasgraph_call.html')

def graph_call(request):
    return render(request, 'graph.html')

def sunggraph_call(request):
    return render(request, 'sunggraph_call.html')
def register_request(request):
	if request.method == "POST": # 입력완료된 데이터를 저장하고 로그인, 루트로 리다이렉트
		form = NewUserForm(request.POST)
		if form.is_valid():
			user = form.save()
			login(request, user)
			messages.success(request, "Registration successful." )
			return redirect("/")
		messages.error(request, "Unsuccessful registration. Invalid information.")
	form = NewUserForm() # 빈폼 : 입력
	return render (request=request, template_name="registration/register.html",
                   context={"register_form":form})



def sunggraph(request, sungjuk_id):
    # 요청된 sungjuk_id에 해당하는 학생을 데이터베이스에서 가져옴
    sungjuk = get_object_or_404(Sungjuk, pk=sungjuk_id)

    # 그래프를 그리기 위한 데이터프레임 생성
    data = {'Kor': sungjuk.kor, 'Mat': sungjuk.mat, 'Eng': sungjuk.eng}
    scores = pd.DataFrame(data, index=[sungjuk.name])

    # 그래프 그리기
    fig = plt.figure(figsize=(6, 4.5), dpi=80, facecolor='w', edgecolor='w')
    ax = fig.add_subplot(111)
    scores.plot(ax=ax, kind='bar')
    ax.set_title('Graph')
    ax.set_xlabel('Subject')
    ax.set_ylabel('Score')
    ax.legend(title='Student')

    # 그래프 이미지를 HTTP 응답으로 반환
    buf = io.BytesIO()
    canvas = FigureCanvasAgg(fig)
    canvas.print_png(buf)
    fig.clear()
    plt.close('all')
    response = HttpResponse(buf.getvalue(), content_type='image/png')
    response['Content-Length'] = str(len(response.content))
    return response
