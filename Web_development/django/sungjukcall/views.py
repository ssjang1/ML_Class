from django.shortcuts import render
from django.views.generic import TemplateView, ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Sungjuk
# Sungjuk.objects.all()
# Sungjuk.objects.filter()
class SungjukList(ListView): # ListView : 모든데이터를 확인할 때
    model = Sungjuk
    # object_list : get_queryset() 기본적으로 생성 되는 객체 # 데이터를 변경하고싶으면 오버라이딩
    # get_template_names() # sungjuk_list.html # 이름을 변경하고 싶으면 오버라이딩
    template_name = 'sungjukcall/sungjuk_list.html'

class sungjukdetail(DetailView): # 생성자가 pk를 받음
    model = Sungjuk # 기본 꼴
    fields = ['name', 'kor', 'mat', 'eng', 'tot', 'avg']
    template_name = 'sungjukcall/detail.html'
    context_object_name = 'sungjuk' # 실제 데이터를 담았을 때의 이름

# 1인 데이터 입력 : form 사용
# 입력을 성공하고 나서
# form을 생성 formview를 이용해서 연결

# 테이블에 데이터를 입력하는 방법
# form(submit) -> request 파싱 -> query 생성 -> 테이블에 저장
# model : form을 매핑 ( 수정(binding)과 삽입(공백) 사용)
class SungjukCreate(CreateView):
    model = Sungjuk # sungjuk_form.html # 기본폼을 사용
    fields = ['name', 'kor', 'mat', 'eng'] # 입력은 tot avg 불필요
    # redirect 성공하면 원래 페이지로 돌아오는 이유
    success_url = reverse_lazy('sungjukcall:sungjuk_list') # 입력이 완료되면 전체 데이터를 보여주는 화면으로

    # 입력과 다른점
    # 수정을 하려면 데이터를 찾아서 클라이언트에 전송
class SungjukUpdate(UpdateView):
    model = Sungjuk
    fields = ['name', 'kor', 'mat', 'eng']
    success_url = reverse_lazy('sungjukcall:sungjuk_list')
    template_name = 'sungjukcall/sungjuk_form.html'

# pk가 필요
class SungjukDelete(DeleteView):
    model = Sungjuk
    success_url = reverse_lazy('sungjukcall:sungjuk_list')

