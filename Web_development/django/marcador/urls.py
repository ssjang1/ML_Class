from django.urls import path
from marcador import views
app_name = "marcador"
urlpatterns= [ # 기본값이 문자열
    path('user/<username>/', views.bookmark_user, name='marcador_bookmark_user'),
    path('create/', views.bookmark_create, name='marcador_bookmark_create'),
    path('edit/<int:pk>/', views.bookmark_edit, name='marcador_bookmark_edit'),
    path('', views.bookmark_list, name='marcador_bookmark_list'),
]