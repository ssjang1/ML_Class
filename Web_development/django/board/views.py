from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.exceptions import PermissionDenied
from django.shortcuts import get_object_or_404, redirect, render
from .forms import Board_Info_Form
from .models import Board_Info

def board_info_read(request):
    board_infos = Board_Info.objects.all() # default manager
    context = {'board_infos' : board_infos}
    return render(request, 'board/board_info_list.html',context)
# Create your views here.

def board_info_create(request):
    if request.method == 'POST': # 클라이언트에서 데이터가 입력
        form = Board_Info_Form(data=request.POST) # 폼을 채움
        if form.is_valid(): # 데이터가 정당한지
            bookmark = form.save(commit=False) # 커밋없이 저장( 메모리에서 작업 )
            bookmark.save()
            form.save_m2m() # 저장
            return redirect('board:board_board_info_read')
    else: # get인 경우 폼만 전달
        form = Board_Info_Form()
    context = {'form':form, 'create': True}
    return render(request, 'board/form.html', context)

def board_info_update(request, pk):
    board_info = get_object_or_404(Board_Info,pk=pk)
    if request.method == 'POST': # 수정데이터가 form을 통해서 업로드
        form = Board_Info_Form(instance=board_info,data=request.POST)
        if form.is_valid(): # 데이터타입 해당되는 데이터인지
            form.save()
            return redirect('board:board_board_info_read')
    else: # get이면 수정하기위해서 데이터를 바인딩해서 클라이언트로 송신
        form = Board_Info_Form(instance=board_info)
    context = {'form': form, 'create': False}
    return render(request, 'board/form.html', context)

def board_info_delete(request, pk):
    board_info = get_object_or_404(Board_Info, pk=pk)
    if pk is not None:
        board_info.delete()
    return redirect('board:board_board_info_read')