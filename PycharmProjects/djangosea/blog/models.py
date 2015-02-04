#coding=utf-8
# Create your models here.
from django.contrib import admin
import Image
from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(u'用户名',max_length=30)
    password = models.CharField(u'用户密码',max_length=100)
    email = models.EmailField(u'电子邮箱')
    def __unicode__(self):
        return self.username
    class Meta:
        verbose_name = '用户'
        verbose_name_plural = '用户管理'
class Category(models.Model):
    name = models.CharField(u'博客分类', max_length=80)
    sort_num = models.IntegerField(u'排序', default=10)
    blogs = models.IntegerField(u'文章数', default=0)
    user_id = models.IntegerField(u'作者id', default=0)
    def __unicode__(self):
        return '%s' % (self.name)
    class Meta:
        verbose_name = '分类'
        verbose_name_plural = '分类管理'

class Author(models.Model):
    authorname = models.CharField(u'作者姓名', max_length=50)
    address = models.CharField(u'住址', max_length=50)
    def __unicode__(self):
        return '%s' % (self.authorname)
    class Meta:
        verbose_name = '作者'
        verbose_name_plural = '作者管理'
class Comments(models.Model):
    cname = models.CharField(u'评论者', max_length=30)
    blogid = models.IntegerField(u'博客id')
    comment = models.TextField(u'评论内容',max_length=100)
    cdate = models.DateTimeField(u'评论时间')
    def __unicode__(self):
        return u'%s' % (self.cname)
    class Meta:
        ordering = ['-cdate']
        verbose_name = "评论"
        verbose_name_plural = "评论管理"

class Blog(models.Model):
    title = models.CharField(u'标题', max_length=50)
    classify = models.ForeignKey(Category, verbose_name="分类")
    summary = models.CharField(u'博客概要', max_length=200)
    content = models.TextField(u'博客内容')
    img = models.ImageField(u'图片', upload_to ='static/images')
    thumb = models.FilePathField(u'图片路径', path ='static/images/thumb', blank=True)
    authors = models.ForeignKey(Author, verbose_name="作者")
    createdate = models.DateTimeField(u'发表时间')
    keyword = models.CharField(u'关键词', max_length=20)
    hits = models.IntegerField(u'点击数', blank=True, null=True, default=0)
    readnumber = models.IntegerField(u'阅读数', blank=True, null=True, default=0)
    #<figure><img src=""> </figure>
    def __unicode__(self):
        return u' %s' % (self.title)
    class Meta:
        ordering = ['-createdate']
        verbose_name = "博客"
        verbose_name_plural='博客管理'







#admin.site.register((Users, Author, blog))