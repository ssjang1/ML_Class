from django.db import models
from django.urls import reverse
# 테이블과 클래스가 불일치할 때
# @property annotation 장식자를 이용해서 함수를 생성 (변수의 이름과 같아야 함)
# 클래스 변수 이름과 테이블이름을 매핑
class Sungjuk(models.Model):
    # 제약사항을 지정하면서
    # id = models.BigAutoField(primary_key=True) # BigAutoField 자동증가 # primary키가 없으면 이게 자동으로 등록
    name = models.CharField("이름", max_length=50, unique=False)
    kor = models.IntegerField("국어", default=0)
    mat = models.IntegerField("수학", default=0)
    eng = models.IntegerField("영어", default=0)
    tot = models.IntegerField("총점", default=0) # DB에는 저장하고 않고 실시간 계산
    avg = models.FloatField("평균", default=0)
    def __str__(self):
        return self.name
    # property하면 db에 저장 안됨
    @property
    def tot(self):
        return self.kor + self.mat + self.eng
    @property
    def avg(self):
        return round((self.kor+self.mat+self.eng)/3,2)
    def get_absolute_url(self):
        return reverse('server_edit',kwargs={'pk':self.pk})
    class Meta: # 클래스에 대한 정보
        # 테이블에 대한 추가정보
        verbose_name='성적'
        verbose_name_plural='성적셋'
        ordering=['name'] # 이름으로 정렬
# Create your models here.
