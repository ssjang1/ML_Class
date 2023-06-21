from django.forms import ModelForm
from .models import Board_Info

class Board_Info_Form(ModelForm):
    class Meta:
        model = Board_Info # inputbox로 입력 할 수 있도록 자동 생성
        exclude = ()