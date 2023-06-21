from django.contrib import admin
from .models import Bookmark, Tag

class BookmarkAdmin(admin.ModelAdmin):
    list_display = ('url', 'title', 'owner', 'is_public', 'date_updated')
    list_editable = ('is_public',) # 편집가능
    list_filter = ('is_public', 'owner__username') # 필터링해서 뷰
    search_fields = ['url', 'title', 'description'] # 검색
    readonly_fields = ('date_created', 'date_updated') # 수정불가
admin.site.register(Bookmark, BookmarkAdmin)
admin.site.register(Tag)
