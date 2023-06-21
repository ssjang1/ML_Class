from django.db import models
# 데이터 설계(어떤 데이터가 필요 -> 테이블이 어떤 구조)
import datetime
from django.utils import timezone
# 두 개의 테이블의 관계 : primary / foreign
# ORM(object relation mapping)
# 클래스 이름이 테이블 이름과 매핑
# primary key를 생성하지 않으면 id가 자동
class Question(models.Model): # 질문 테이블
    question_text=models.CharField(max_length=200) # 문자열 필드 이름 매핑
    pub_date=models.DateTimeField('date published') # 자동으로 필드를 채움
    def __str__(self):
        return self.question_text
    def was_published_recently(self): # new
        now= timezone.now()
        #최근 데이터는 1일전까지
        return now-datetime.timedelta(days=1)<=self.pub_date <=now

class Choice(models.Model): # 응답
    question=models.ForeignKey(
        'Question',on_delete=models.CASCADE, # 질문이 지워질때 같이 지워라..
    )
    choice_text=models.CharField(max_length=200) # 질문에 대한 선택
    votes=models.IntegerField(default=0) # 몇번 투표
    def __str__(self):
        return self.choice_text
# Create your models here.
