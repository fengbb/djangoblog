#coding=utf-8
from django.contrib import admin
from blog.models import Author, Blog, Category, Comments, User

# Register your models here.
from . import models

#admin.site.register(models.Article)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('authorname', 'address')
    search_fields = ('authorname',)
    list_filter = ('authorname',)
class BlogAdmin(admin.ModelAdmin):
    list_display = ('title', 'classify', 'summary',  'authors', 'createdate', 'keyword', 'img', 'thumb')
    search_fields = ('title',)
    list_filter = ('createdate',)
    date_hierarchy = 'createdate'
    ordering = ('-createdate',)
    fields = ('title', 'classify', 'summary', 'authors', 'img', 'keyword', 'thumb', 'content', 'createdate')
class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'password', 'email')
class CommentsAdmin(admin.ModelAdmin):
    list_display = ('cname', 'blogid', 'comment', 'cdate')

admin.site.register(Author, AuthorAdmin)
admin.site.register(Blog, BlogAdmin)
admin.site.register(Category)
admin.site.register(Comments)
admin.site.register(User,UserAdmin)