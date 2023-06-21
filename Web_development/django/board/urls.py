from sungjukcall import views
from django.urls import path
from board import views
app_name = "board"
urlpatterns = [
    path('create/', views.board_info_create, name='board_board_info_create'),
    path('', views.board_info_read, name='board_board_info_read'),
    path('update/<int:pk>/', views.board_info_update, name='board_board_info_update'),
    path('delete/<int:pk>/', views.board_info_delete, name='board_board_info_delete')
]