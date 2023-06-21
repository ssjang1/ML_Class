from django.contrib import admin
from .models import Question, Choice

class ChoiceInline(admin.TabularInline): # 질문에 대한 응답 개수가 옆으로 표시
    model=Choice
    extra=3
# 관리자만 입력이 가능 (질문 + 응답선택)
class QuestionAdmin(admin.ModelAdmin): # 관리자에서 사용하는 테이블 형식
    fieldsets=[
        ('Question Statement',{'fields':['question_text']}),
        ('Date Information',{'fields':['pub_date'],'classes':['collapse']}),
    ]
    inlines=[ChoiceInline] # 선택어도 같이 입력형태로
    list_display=('question_text','pub_date')
    list_filter=['pub_date'] # 날짜를 지정
    search_fields = ['question_text'] # 검색

# 관리자 페이지에 등록
admin.site.register(Question,QuestionAdmin)
admin.site.register(Choice)
# Register your models here.
