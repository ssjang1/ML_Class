from django.forms import ModelForm
from .models import Bookmark
class BookmarkForm(ModelForm):
    class Meta:
        model = Bookmark
        exclude = ('date_created', 'date_updated', 'owner', 'date') # 관리를 위해 필요한 필드는 제외
