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

from django.views.generic.base import TemplateView
from django.contrib.auth.models import User

def viewTopArticleList(uid=-1):
    if uid>-1:
        articleList=Article.objects.order_by("-views").filter(user_id=uid).filter(status=1)[:5]
    else:
        articleList=Article.objects.order_by("-views").filter(status=1)[:5]
    return articleList

def commentTopArticleList(uid=-1):
    if uid>-1:
        articleList=Article.objects.order_by("-comments").filter(user_id=uid).filter(status=1)[:5]
    else:
        articleList=Article.objects.order_by("-comments").filter(status=1)[:5]
    
    return articleList

def newTopArticleList(uid=-1):
    if uid>-1:
        articleList=Article.objects.order_by("-createTime").filter(user_id=uid).filter(status=1)[:5]
    else:
        articleList=Article.objects.order_by("-createTime").filter(status=1)[:5]
    return articleList

def newTopUserList():
    userList=User.objects.order_by("-id").all()
    return userList


def categoryList(uid=-1):
    if uid>-1:
        categoryList=Category.objects.order_by("-sort_num").filter(user_id=uid)
    else:
        categoryList=Category.objects.order_by("-sort_num").all()
    return categoryList

def Users(request,uid):
    uid=int(uid)
    ret=[]
    
    currentUser=request.user
    if  currentUser.id :
        currentUserProfile=currentUser.get_profile()
    else:
        asdf=""
        currentUser=None
        currentUserProfile=None
    if currentUser and currentUser.id==uid:
        isMe=True
    else:
        isMe=False

    ret.append(isMe)
    ret.append(currentUser)
    ret.append(currentUserProfile)
    
    if uid>0:
        try:
            isGuest=True
            guestUser=User.objects.get(id=uid)
        except:
            isGuest=False
            guestUser=None
    
        if isGuest:
            try:
                guestUserProfile=guestUser.get_profile()
            except:
                guestUserProfile=False
    else:
        isGuest=False
        guestUser=None
        guestUserProfile=None

    ret.append(isGuest)
    ret.append(guestUser)
    ret.append(guestUserProfile)

    return ret
