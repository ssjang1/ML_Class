from django.db import models
from django.contrib.auth.models import User
from django.utils.timezone import now
class PublicBookmarkManager(models.Manager): # 상속
    def get_queryset(self): # 플라스크나 pymysql에서는 Resultset 오버라이딩
        qs = super(PublicBookmarkManager, self).get_queryset() # 모든 데이터
        return qs.filter(is_public=True) # 공개된 내용만
class Tag(models.Model): # 테이블의 데이터는 순서적으로 저장
    name = models.CharField(max_length=50, unique=True)
    class Meta:
        verbose_name = '태그'
        verbose_name_plural = '태그'
        ordering = ['name']
    def __str__(self):
        return self.name

class Bookmark(models.Model):
    url = models.URLField('웹주소')
    title = models.CharField('제목', max_length=255)
    description = models.TextField('상세설명', blank=True)
    is_public = models.BooleanField('public', default=True)
    date_created = models.DateTimeField('date created')
    date_updated = models.DateTimeField('date updated')
    # 연결하면서 User 입장에서 Bookmark를 연결하기 위한 이름을 bookmarks로 줌
    owner = models.ForeignKey(User, verbose_name='owner', related_name='bookmarks',
                              on_delete=models.CASCADE) # 유저가 삭제되면 북마크도 같이 삭제
    tags = models.ManyToManyField(Tag, verbose_name='태그선택', blank=True)
    objects = models.Manager() # 기본 매니저
    public = PublicBookmarkManager() # 매니저 추가
    class Meta:
        verbose_name = 'bookmark'
        verbose_name_plural = 'bookmarks'
        ordering = ['-date_created']
    def __str__(self):
        return '%s (%s)' % (self.title, self.url)

    def save(self,*args, **kwargs):
        if not self.id: # 신규라는 것
            self.date_create = now()
        self.date_updated = now()
        super(Bookmark, self).save(*args, **kwargs)
