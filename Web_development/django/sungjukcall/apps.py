from django.apps import AppConfig


class SungjukcallConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "sungjukcall"

# 장고는 apps로 구성
# python manage.py startapp sungjukcall
# models(데이터베이스 테이블 생성), views(action : model+templates), urls(url+action)
# MVT + urls
# view가 발달
    # CreateView, DetailView, UpdateView, DeleteView, FormView
    # class 내부에 기본적으로 동작하는 함수들이 자동으로 호출
# models 정의 -> python manage.py makemigrations 앱이름 -> Query문 작성
#            -> python manage.py makemigrae 테이블생성