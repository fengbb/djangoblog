#-*- coding:utf-8 -*-

import time,datetime

from django.shortcuts import get_object_or_404, render,render_to_response
from django.http import *
from django.http import HttpResponse,HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger

from django.views.generic.base import TemplateView
from django.views import generic
from django.db.models import Q
from django.db import connection
from django.template import RequestContext 
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.models import User
from django.contrib import auth
from TBlog.models import Category, Article,UserProfile
from django.contrib.auth.models import User
import common

import utility

def createUserProfile(user):
        profile=UserProfile(user=user)
        profile.blog_domain=user.username
        profile.blog_title=user.username+"的博客".decode("utf-8")
        profile.blog_keywords=user.username
        profile.blog_about=user.username
        profile.blog_announcement=""
        profile.blog_template="default"
        profile.blog_css=""
        profile.blog_headhtml=""
        profile.blog_footerhtml=""

        profile.createtime=datetime.datetime.now()
        profile.stat_articles=0
        profile.stat_views=0
        profile.stat_comments=0
        profile.save()

def register(request):
    if utility.HasPostData(request,"ok"):
        username=utility.GetPostData(request,"username")
        password=utility.GetPostData(request,"password")
        email=utility.GetPostData(request,"email")
        user=User.objects.create_user(username,email,password)
        user.first_name=username
        user.save()

        createUserProfile(user)

        return HttpResponseRedirect('/')
    else:
        return utility.my_render_to_response(request,"register.html",locals())

def login(request):
    if utility.HasPostData(request,"ok"):
        username=utility.GetPostData(request,"username")
        password=utility.GetPostData(request,"password")
        user=auth.authenticate(username=username,password=password)
        if user is not None:
            try:
                userProfile=user.get_profile()
            except:
                createUserProfile(user)
            if user.is_active:
                auth.login(request,user)
                return HttpResponseRedirect('/')
            else:
                return HttpResponseRedirect('')
        else:
            return HttpResponseRedirect('')
    else:
        return utility.my_render_to_response(request,"login.html",locals())

def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/')

#def home(request):
#    viewsTopArticles=common.viewsTopArticles()
#    remarkTopArticles=common.remarkTopArticles()
#    newTopArticles=common.newTopArticles()
#    categoryList=common.categoryList()

#    articleList=Article.objects.order_by("-createTime").all()

#    return my_render_to_response(request,"home.html",locals())
#    #return HttpResponse(html)

#def show(request,aid):
#    viewsTopArticles=common.viewsTopArticles()
#    remarkTopArticles=common.remarkTopArticles()
#    newTopArticles=common.newTopArticles()
#    categoryList=common.categoryList()

#    articleInfo=Article.objects.get(id=aid)
#    title=articleInfo.title
#    content=articleInfo.content
#    articleInfo.views+=1
#    if not articleInfo.createTime:
#        articleInfo.createTime=datetime.datetime.now()

#    articleInfo.save()

#    return my_render_to_response(request,"articleshow.html",locals())


    


#def edit(request,aid):
#    viewsTopArticles=common.viewsTopArticles()
#    remarkTopArticles=common.remarkTopArticles()
#    newTopArticles=common.newTopArticles()
#    categoryList=common.categoryList()


#    if request.POST.has_key('ok'):
#        articleInfo=Article.objects.get(id=aid)
        
#        articleInfo.category=Category.objects.get(id=GetPostData(request,'category'))
#        articleInfo.title = GetPostData(request,'title')
#        articleInfo.pic = GetPostData(request,'pic')
#        articleInfo.tags=GetPostData(request,'tags')
#        articleInfo.summary=GetPostData(request,'summary')
#        articleInfo.content = GetPostData(request,'content')

#        articleInfo.save()

#        return HttpResponseRedirect('/')
#    else:
#        articleInfo=Article.objects.get(id=aid)
#        title=articleInfo.title
#        content=articleInfo.content
#        return my_render_to_response(request,"editarticle.html",locals())








