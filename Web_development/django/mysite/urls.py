"""
URL configuration for mysite project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from . import views
# path vs re_path(regular expression을 사용한 주소 사용 )
# urls 사용 => urlpatterns => path, re_path
urlpatterns = [
    path("admin/", admin.site.urls), # 최근 사용법
    path("accounts/", include("django.contrib.auth.urls")),
    path("register/", views.register_request, name="register"),
    path('sunggraph/<int:sungjuk_id>/', views.sunggraph, name='sunggraph'),
    path('sunggraph_call',views.sunggraph,name='sunggraph'),
    path('pandasgraph', views.pandasgraph, name='pandasgraph'),
    path('pandasgraph_call', views.pandasgraph_call, name='pandasgraph_call'),
    path('', views.HomeView.as_view(), name='home'),# class인 경우 as_view
    # ^ 맨처음 $마지막 , regula expression (정규표현식)
    path('polls/', include('polls.urls')),
    path('sungjukcall/', include('sungjukcall.urls')),
    path('addressbook/', include('addressbook.urls')),
    path('board/', include('board.urls')),
    path('graph/', views.graph_call, name='graph'),
    path('marcador/', include('marcador.urls')),
]
# 이름, 국어, 영어, 수학 출력하는 app을 작성하여 제출하시요 ( mail, 이름_날짜.zip )
