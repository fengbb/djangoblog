#-*- coding:utf-8 -*-

from django.shortcuts import get_object_or_404, render
from django.http import *
from django.http import HttpResponse,HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic
from django.shortcuts import render_to_response
from django.http import HttpResponse,HttpResponseRedirect
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger
import time,datetime
from django.db.models import Q
from django.db import connection
from django.template import RequestContext 

from TBlog.models import Category, Article
from django.contrib.auth.models import User
from django.views.generic.base import TemplateView
from django.contrib.auth.decorators import login_required
import common

import utility


def home(request,uid):
    uid=int(uid)
    userInfos=common.Users(request,uid)

    templateName=templateName=userInfos[5].blog_template
    
    viewTopArticleList=common.viewTopArticleList(uid)
    commentTopArticleList=common.commentTopArticleList(uid)
    newTopArticleList=common.newTopArticleList(uid)
    newTopUserList=common.newTopUserList()

    categoryList=common.categoryList(uid)

    userProfile=userInfos[5]
    userProfile.stat_views+=1
    userProfile.save()

    articleList=Article.objects.order_by("-createTime").filter(user_id=uid).filter(status=1)
        
    return utility.my_render_to_response(request,templateName+"/home.html",locals())



def show(request,uid=-1,aid=-1,*arg,**kwarg):
    uid=int(uid)
    userInfos=common.Users(request,uid)

    templateName=templateName=userInfos[5].blog_template

    viewTopArticleList=common.viewTopArticleList(uid)
    commentTopArticleList=common.commentTopArticleList(uid)
    newTopArticleList=common.newTopArticleList(uid)
    newTopUserList=common.newTopUserList()

    categoryList=common.categoryList(uid)
    

    articleInfo=Article.objects.get(id=aid)
    title=articleInfo.title
    content=articleInfo.content
    articleInfo.views+=1
    if not articleInfo.createTime:
        articleInfo.createTime=datetime.datetime.now()

    articleInfo.save()

    return utility.my_render_to_response(request,templateName+"/show.html",locals())

def category(request,uid,cid):
    uid=int(uid)
    userInfos=common.Users(request,uid)

    templateName=templateName=userInfos[5].blog_template

    viewTopArticleList=common.viewTopArticleList(uid)
    commentTopArticleList=common.commentTopArticleList(uid)
    newTopArticleList=common.newTopArticleList(uid)
    newTopUserList=common.newTopUserList()

    categoryList=common.categoryList(uid)
    currentCategory=Category.objects.get(id=cid)

    articleList=Article.objects.order_by("-createTime").filter(user_id=uid).filter(category_id=cid).filter(status=1)

    return utility.my_render_to_response(request,templateName+"/home.html",locals())

def tags(request,uid,cid):
    uid=int(uid)
    userInfos=common.Users(request,uid)
    templateName=templateName=userInfos[5].blog_template

    viewTopArticleList=common.viewTopArticleList(uid)
    commentTopArticleList=common.commentTopArticleList(uid)
    newTopArticleList=common.newTopArticleList(uid)
    newTopUserList=common.newTopUserList()

    categoryList=common.categoryList(uid)

    articleList=Article.objects.order_by("-createTime").filter(user_id=uid).filter(category_id=cid).filter(status=1)

    return utility.my_render_to_response(request,templateName+"/home.html",locals())

@login_required()
def list(request,uid,cid=-1):
    uid=int(uid)
    cid=int(cid)
    userInfos=common.Users(request,uid)
    categoryList=common.categoryList(userInfos[1].id)

    articleList=Article.objects.order_by("-createTime").filter(user_id=userInfos[1].id)

    return utility.my_render_to_response(request,"pub/articlelist.html",locals())

@login_required()
def listdraft(request,uid):
    uid=int(uid)
    userInfos=common.Users(request,uid)
    categoryList=common.categoryList(userInfos[1].id)

    articleList=Article.objects.order_by("-createTime").filter(user_id=userInfos[1].id).filter(status=0)
    return utility.my_render_to_response(request,"pub/articlelist.html",locals())


@login_required()
def listcategory(request,uid,cid=-1):
    uid=int(uid)
    cid=int(cid)
    userInfos=common.Users(request,uid)
    categoryList=common.categoryList(userInfos[1].id)

    articleList=Article.objects.order_by("-createTime").filter(user_id=userInfos[1].id).filter(category_id=cid)

    return utility.my_render_to_response(request,"pub/articlelist.html",locals())


@login_required()
def add(request,*arg,**kwarg):
    uid=int(-1)
    userInfos=common.Users(request,uid)

    categoryList=common.categoryList(userInfos[1].id)

    if request.POST.has_key('ok'):
        cateId=int(utility.GetPostData(request,'category'))
        category=Category.objects.get(id=utility.GetPostData(request,'category'))
        
        title = utility.GetPostData(request,'title')
        pic = utility.GetPostData(request,'pic')
        tags=utility.GetPostData(request,'tags')
        summary=utility.GetPostData(request,'summary')
        content = utility.GetPostData(request,'content')
        status = int(utility.GetPostData(request,'status'))

        if summary=="":
            tempContent=utility.RemoveTags(content)
            summary=tempContent[0:200] if len(tempContent)>200 else tempContent
        else:
            summary=utility.RemoveTags(summary)

        articleInfo=Article(category=category)
        articleInfo.createTime=datetime.datetime.now()
        if category.id !=1:
            category.articles+=1
            category.save()

        articleInfo.category=category
        articleInfo.title = title
        articleInfo.pic=pic
        articleInfo.tags=tags
        articleInfo.summary=summary
        articleInfo.content = content
        articleInfo.createTime=datetime.datetime.now()
        articleInfo.views=0
        articleInfo.comments=0
        articleInfo.goods=0
        articleInfo.bads=0
        articleInfo.status=status
        articleInfo.user_id=request.user.id
        articleInfo.user_name=request.user.username

        articleInfo.save()

        userProfile=userInfos[2]
        userProfile.stat_articles+=1
        userProfile.save()

        return HttpResponseRedirect('/%d/' %request.user.id)
    else:
        
        articleInfo=Article()

        return utility.my_render_to_response(request,"pub/articleedit.html",locals())

@login_required()
def edit(request,uid,aid):
    uid=int(uid)
    userInfos=common.Users(request,uid)

    categoryList=common.categoryList(userInfos[1].id)
    
    articleInfo=Article.objects.get(id=aid)

    if request.POST.has_key('ok'):
        cateId=int(utility.GetPostData(request,'category'))
        category=Category.objects.get(id=utility.GetPostData(request,'category'))
        title = utility.GetPostData(request,'title')
        pic = utility.GetPostData(request,'pic')
        tags=utility.GetPostData(request,'tags')
        summary=utility.GetPostData(request,'summary')
        content = utility.GetPostData(request,'content')
        status = int(utility.GetPostData(request,'status'))

        if summary=="":
            tempContent=utility.RemoveTags(content)
            summary=tempContent[0:200] if len(tempContent)>200 else tempContent
        else:
            summary=utility.RemoveTags(summary)

        if articleInfo.category != category:
            if category.id !=1:
                category.articles+=1
                category.save()
            if articleInfo.category.id!=1:
                oldCategory=Category.objects.get(id=articleInfo.category.id)
                oldCategory.articles=oldCategory.articles-1 if oldCategory.articles>0 else 0
                oldCategory.save()

        articleInfo.category=category
        articleInfo.title = title
        articleInfo.pic=pic
        articleInfo.tags=tags
        articleInfo.summary=summary
        articleInfo.content = content
        #articleInfo.createTime=datetime.datetime.now()
        #articleInfo.views=0
        #articleInfo.comments=0
        #articleInfo.goods=0
        #articleInfo.bads=0
        articleInfo.status=status
        #articleInfo.user_id=request.user.id
        #articleInfo.user_name=request.user.username

        articleInfo.save()

        return HttpResponseRedirect('/%d/' %request.user.id)
    else:
        return utility.my_render_to_response(request,"pub/articleedit.html",locals())

@login_required()
def delete(request,aid,uid=-1):
    uid=int(uid)
    userInfos=common.Users(request,uid)

    categoryList=common.categoryList(userInfos[1].id)

    articleInfo=Article.objects.get(id=aid)
    articleInfo.delete()
    
    userProfile=userInfos[2]
    userProfile.stat_articles-=1
    userProfile.save()

    articleList=Article.objects.order_by("-createTime").filter(user_id=userInfos[1].id)
    return HttpResponseRedirect('/pub/article/list/')


