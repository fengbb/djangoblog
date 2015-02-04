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

def index(request,uid=-1):
    userInfos=common.Users(request,-1)
    userProfile=userInfos[2]

    if utility.HasPostData(request,"ok"):
       
        userProfile.blog_domain=utility.GetPostData(request,"blog_domain")
        userProfile.blog_title=utility.GetPostData(request,"blog_title")
        userProfile.blog_keywords=utility.GetPostData(request,"blog_keywords")
        userProfile.blog_about=utility.GetPostData(request,"blog_about")
        userProfile.blog_announcement=utility.GetPostData(request,"blog_announcement")
        userProfile.blog_template=utility.GetPostData(request,"blog_template")
        userProfile.blog_css=utility.GetPostData(request,"blog_css")
        userProfile.blog_headhtml=utility.GetPostData(request,"blog_headhtml")
        userProfile.blog_footerhtml=utility.GetPostData(request,"blog_footerhtml")

        #userProfile.createtime=datetime.datetime.now()
        #userProfile.stat_articles=0
        #userProfile.stat_views=0
        #userProfile.stat_comments=0

      
        userProfile.save()

        return HttpResponseRedirect('/')
    else:
        return utility.my_render_to_response(request,"pub/profile.html",locals())



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








