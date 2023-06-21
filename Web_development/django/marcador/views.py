from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.exceptions import PermissionDenied
from django.shortcuts import get_object_or_404, redirect
# 페이지별로 데이터를 출력
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# 현재 app에서 작성
from .forms import BookmarkForm
from .models import Bookmark
from django.utils import timezone

def bookmark_list(request):
    bookmarks = Bookmark.public.all()
    page = request.GET.get('page', 1) # GET, POST 대문자, 없으면 처음부터 (1)
    paginator = Paginator(bookmarks, 5) # 한 페이지가 5개의 정보를 담아서 페이지화
    try:
        bookmarks_page = paginator.page(page)
    except PageNotAnInteger: # 페이지가 숫자로 들어오지 않은 경우
        bookmarks_page = paginator.page(1)
    except EmptyPage: # 페이지가 넘어오지 않았을 경우 num_pages에 현재 가리키고 있는 페이지 번호
        bookmarks_page = paginator.page(paginator.num_pages)
    context = {'bookmarks': bookmarks_page}
    return render(request, 'marcador/bookmark_list.html', context)

def bookmark_user(request, username):
    user = get_object_or_404(User, username=username)
    if request.user == user: # 로그인한 유저(쿠키), 쿼리결과의 유저가 동일
        bookmarks = user.bookmarks.all() # objects, public만 만들었는데 bookmarks는 뭐일까? -> models에 있음
    else:
        bookmarks = Bookmark.public.filter(owner__Username=username)
    context = {'bookmarks': bookmarks, 'owner': user}
    return render(request, 'marcador/bookmark_user.html', context)

@login_required
def bookmark_create(request):

    if request.method == 'POST': # 저장

        form = BookmarkForm(request.POST)

        if form.is_valid(): # 각 필드의 형식
            bookmark = form.save(commit=False)
            bookmark.owner = request.user
            bookmark.date_created = timezone.now()
            bookmark.save()
            form.save_m2m()
            return redirect('marcador:marcador_bookmark_user',
                            username=request.user.username)
    else:
        form = BookmarkForm()
    context = {'form': form, 'create': True} # 수정에서 사용
    return render(request, 'marcador/form.html', context)

@login_required
def bookmark_edit(request, pk):
    bookmark = get_object_or_404(Bookmark, pk=pk) # 원래데이터
    if bookmark.owner != request.user and not request.user.is_superuser:
        raise PermissionDenied
    if request.method == 'POST':
        form = BookmarkForm(instance=bookmark, data=request.POST) # 원래데이터, 수정된 데이터
        if form.is_vaild():
            form.save()
            return redirect('marcador:marcador_bookmark_user',
                            username=request.user.username)
    else:
        form = BookmarkForm(instance=bookmark)
    context = {'form': form, 'create': False}
    return render(request, 'marcador/form.html', context)