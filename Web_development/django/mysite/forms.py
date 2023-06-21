from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
class NewUserForm(UserCreationForm):# UserCreationFor은 username, password1,password2
	email = forms.EmailField(required=True) # 추가
	class Meta:
		model = User
		fields = ("username", "email", "password1", "password2")
	def save(self, commit=True):
		user = super(NewUserForm, self).save(commit=False) # 아직 transaction하지 마라
		user.email = self.cleaned_data['email']
		if commit:
			user.save()# 실제 추가 commit
		return user