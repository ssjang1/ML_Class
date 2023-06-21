from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.exceptions import PermissionDenied
from django.shortcuts import get_object_or_404, redirect, render
from .forms import Addr_Info_Form
from .models import Addr_Info

def addr_info_read(request):
    addr_infos = Addr_Info.objects.all() # default manager
    context = {'addr_infos' : addr_infos}
    return render(request, 'addressbook/addr_info_list.html',context)
# Create your views here.

@login_required(login_url="/accounts/login/")
def addr_info_create(request):
    if request.method == 'POST': # 클라이언트에서 데이터가 입력
        form = Addr_Info_Form(data=request.POST) # 폼을 채움
        if form.is_valid(): # 데이터가 정당한지
            bookmark = form.save(commit=False) # 커밋없이 저장( 메모리에서 작업 )
            bookmark.save()
            form.save_m2m() # 저장
            return redirect('addressbook:addressbook_addr_info_read')
    else: # get인 경우 폼만 전달
        form = Addr_Info_Form()
    context = {'form':form, 'create': True}
    return render(request, 'addressbook/form.html', context)
@login_required # 로그인 한 사람의 정보를 서버쪽으로 항상 보냄
def addr_info_update(request, pk):
    addr_info = get_object_or_404(Addr_Info,pk=pk)
    if not request.user.is_superuser:
        raise PermissionDenied # raise: 강제로 예외를 발생시킴
    if request.method == 'POST': # 수정데이터가 form을 통해서 업로드
        form = Addr_Info_Form(instance=addr_info,data=request.POST)
        if form.is_valid(): # 데이터타입 해당되는 데이터인지
            form.save()
            return redirect('addressbook:addressbook_addr_info_read')
    else: # get이면 수정하기위해서 데이터를 바인딩해서 클라이언트로 송신
        form = Addr_Info_Form(instance=addr_info)
    context = {'form': form, 'create': False}
    return render(request, 'addressbook/form.html', context)

@login_required
def addr_info_delete(request, pk):
    addr_info = get_object_or_404(Addr_Info, pk=pk)
    if not request.user.is_superuser:
        raise PermissionDenied
    if pk is not None:
        addr_info.delete()
    return redirect('addressbook:addressbook_addr_info_read')