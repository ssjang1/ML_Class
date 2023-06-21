from django.db import models
class Board_Info(models.Model):
    subject = models.CharField('주제', max_length=20)
    contents = models.TextField('내용')
    nickname = models.CharField('닉네임', max_length=20)
    date = models.IntegerField('작성일')
    class Meta:
        verbose_name = '개인글'
        verbose_name_plural = '글 목록'
        ordering = ['subject']
    def __str__(self):
        return self.subject

    def save(self, *args, **kwargs):
        super(Board_Info, self).save(*args, **kwargs)