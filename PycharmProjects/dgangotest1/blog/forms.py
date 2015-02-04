# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django import forms
from django.forms.formsets import BaseFormSet, formset_factory
from models import *
import re
from django.core import validators
from django.core.exceptions import ObjectDoesNotExist


from bootstrap3.tests import TestForm

RADIO_CHOICES = (
    ('1', 'Radio 1'),
    ('2', 'Radio 2'),
)

MEDIA_CHOICES = (
    ('Audio', (
        ('vinyl', 'Vinyl'),
        ('cd', 'CD'),
    )
    ),
    ('Video', (
        ('vhs', 'VHS Tape'),
        ('dvd', 'DVD'),
    )
    ),
    ('unknown', 'Unknown'),
)


class ContactForm(TestForm):
    pass


class ContactBaseFormSet(BaseFormSet):
    def add_fields(self, form, index):
        super(ContactBaseFormSet, self).add_fields(form, index)

    def clean(self):
        super(ContactBaseFormSet, self).clean()
        raise forms.ValidationError("This error was added to show the non form errors styling")

ContactFormSet = formset_factory(TestForm, formset=ContactBaseFormSet,
                                 extra=2,
                                 max_num=4,
                                 validate_max=True)


class FilesForm(forms.Form):
    text1 = forms.CharField()
    file1 = forms.FileField()
    file2 = forms.FileField(required=False)
    file3 = forms.FileField(widget=forms.ClearableFileInput)
    file4 = forms.FileField(required=False, widget=forms.ClearableFileInput)


class ArticleForm(forms.Form):
    title = forms.CharField()
    pub_date = forms.DateField()

    def clean(self):
        cleaned_data = super(ArticleForm, self).clean()
        raise forms.ValidationError("This error was added to show the non field errors styling.")
        return cleaned_data
class ContactForm(forms.Form):
    subject = forms.CharField()
    email = forms.EmailField(required=False)
    message = forms.CharField()
class RegistrationForm(forms.Form):
    def __init__(self):
        self.fields = (
            forms.TextField(field_name='username',
                            length=30, maxlength=30,
                            is_required=True, ValueError_list=[validators.isAlphaNumeric,
                                                               self.isValidUsername]),
            forms.EmailField(field_name='email',
                             length=30,
                             maxlength=30,
                             is_required=True),
            forms.PasswordField(field_name='password1',
                                lenght=30,
                                maxlength=60,
                                is_required=True),
            forms.PasswordField(field_name='password2',
                                length=30,
                                maxlength=60,
                                is_required=True,
            validators_list=[validators.AlwaysMatchesOtherField('password1',
                                                                'Passwords must match')])
        )
    def isValidUsername(self, field_data, all_data):
        try:
            User.objects.get(username=field_data)
        except User.DoesNotExist:
            return
        raise validators.ValidationError('用户 "%s" 已经被注册' % field_data)
    def save(self, new_data):
        u = User.objects.create_user(new_data['username'],
                                     new_data['email'],
                                     new_data['password1'])
        u.is_active = False
        u.save()
        return u
#评论
blog_dict = {'class': 'required'}
class CommentForm(forms.Form):
    #def __init__(self, *args, **kwargs):
    #    super(CommentForm, self).__init__(*args, **kwargs)
    #    self.fields['blogid'].choices = [('', '----------')] + [(b.id, b.title) for b in Blog.objects.all()]
    #cname = forms.CharField(label='评论者', max_length=30)
    #blogid = forms.IntegerField(label='博客id')
    #blogid = forms.ChoiceField(label='博客id', choices=(), widget=forms.Select(attrs=blog_dict))
    #comment = forms.Textarea(attrs={'cols':80, 'row':20})
    comment = forms.CharField(label='内 容', widget=forms.Textarea(attrs={'cols':115,'row':15}))
    #def clean_comment(self):
    #    cleaned_data=super(CommentForm,self).clean()
    #    comment_data=cleaned_data.get('comment')
    #    if Comments.objects.filter(comment=comment_data).count() is not 0:
    #        raise forms.ValidationError(u'评论内容不能为空')
    #    return cleaned_data
    #cdate = forms.DateTimeField()
#注册
class UserForm(forms.Form):
    username = forms.CharField(label='用户名')
    password = forms.CharField(label='密码', widget = forms.PasswordInput())

class UserRegistForm(forms.Form):
    username = forms.CharField(label='用户名')
    password = forms.CharField(label='密码', widget = forms.PasswordInput())
    email = forms.EmailField(label='电子邮箱')
    def clean_email(self):
        cleaned_data=super(UserRegistForm,self).clean()
        email_data=cleaned_data.get('email')
        if User.objects.filter(email=email_data).count() is not 0:
            raise forms.ValidationError(u'邮箱已被注册,请使用其他邮箱或者找回密码。')
        user_data=cleaned_data.get('username')
        if User.objects.filter(username=user_data).count() is not 0:
            raise forms.ValidationError(u'用户名已存在，请更换用户名')
        return cleaned_data
#    def clean_user(self):
#        cleaned_data=super(UserRegistForm,self).clean()
#        user_data=cleaned_data.get('username')
#        if User.objects.filter(username=user_data).count() is not 0:
#            raise forms.ValidationError(u'用户名已存在，请更换用户名')
#        return cleaned_data