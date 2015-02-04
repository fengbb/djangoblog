#-*- coding:utf-8 -*-
import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

class Category(models.Model):
    name=models.CharField(max_length=80)
    sort_num=models.IntegerField(default=10)
    articles=models.IntegerField(default=0)
    user_id=models.IntegerField(default=0)

class Article(models.Model):
    category=models.ForeignKey(Category)
    title=models.CharField(max_length=200)
    pic=models.CharField(max_length=80)
    tags=models.CharField(max_length=120)
    summary=models.CharField(max_length=500)
    content=models.TextField()
    createTime=models.DateTimeField(default="0000-00-00 00:00:00")
    views=models.IntegerField(default=0)
    comments=models.IntegerField(default=0)
    goods=models.IntegerField(default=0)
    bads=models.IntegerField(default=0)
    status=models.IntegerField(default=1)       #1发布；0草稿
    user_id=models.IntegerField(default=1)
    user_name=models.CharField(max_length=80)


class UserProfile(models.Model):
    user=models.ForeignKey(User,unique=True)
    blog_domain=models.CharField(max_length=200)
    blog_title=models.CharField(max_length=200)
    blog_keywords=models.CharField(max_length=500)
    blog_about=models.CharField(max_length=500)
    blog_announcement=models.CharField(max_length=500)
    blog_template=models.CharField(max_length=50)
    blog_css=models.CharField(max_length=500)
    blog_headhtml=models.CharField(max_length=500)
    blog_footerhtml=models.CharField(max_length=500)
    createtime=models.DateTimeField(default=datetime.datetime.now())
    stat_articles=models.IntegerField(default=0)
    stat_views=models.IntegerField(default=0)
    stat_comments=models.IntegerField(default=0)

# Create your models here.
#class Poll(models.Model):
#    question=models.CharField(max_length=200)
#    pub_date=models.DateTimeField('date published')

#    def __unicode__(self):
#        return self.question

#    def was_published_recently(self):
#        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
#    was_published_recently.admin_order_field = 'pub_date'
#    was_published_recently.boolean = True
#    was_published_recently.short_description = 'Published recently?'



#class Choice(models.Model):
#    poll=models.ForeignKey(Poll)
#    choice_text=models.CharField(max_length=200)
#    votes=models.IntegerField(default=0)

#    def __unicode__(self):
#        return self.choice_text

#class MyView(BaseView):

#    def __init__(self):
#        self.Hour=34
#        self.PropertyChanged=None

#    def BaseView(request):
#        return BaseView(request,"myview")

#    def GetContext():
#        return {"var":"456"}

#    def OnPropertyChanged(self):
#        if(self.PropertyChanged!=None):
#            self.PropertyChanged()
