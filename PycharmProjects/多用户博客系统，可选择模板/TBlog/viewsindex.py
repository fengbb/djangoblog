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
from django.contrib.auth.decorators import login_required
import common
import utility


def index(request):
    userInfos=common.Users(request,-1)

    viewTopArticleList=common.viewTopArticleList()
    commentTopArticleList=common.commentTopArticleList()
    newTopArticleList=common.newTopArticleList()
    newTopUserList=common.newTopUserList()

    categoryList=common.categoryList()
    

    articleList=Article.objects.order_by("-createTime").all()

    return utility.my_render_to_response(request,"index.html",locals())


def test(request):
    return utility.my_render_to_response(request,"test.html",locals())