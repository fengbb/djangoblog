#-*- coding:utf-8 -*-

from django.conf.urls import patterns, include, url
from TBlog.views import *
from TBlog.models import *
import settings
from django.contrib import admin
admin.autodiscover()

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    #url(r'^accounts/login/$',login,name='login'),
    #url(r'^accounts/logout/$',logout,name='logout'),
    
)

urlpatterns += patterns('',
     url(r'^$', 'TBlog.viewsindex.index', name='index'),
     url(r'^test/$', 'TBlog.viewsindex.test', name='test'),
     url(r'^site_media/(?P<path>.*)','django.views.static.serve',{'document_root': settings.MEDIA_ROOT}),

)

urlpatterns += patterns('',
    # Examples:
     url(r'^$', 'index', name='index'),
     
     url(r'^accounts/login/$', 'TBlog.viewsuser.login', name='login'),
     url(r'^accounts/logout/$', 'TBlog.viewsuser.logout', name='logout'),
     url(r'^accounts/register/$', 'TBlog.viewsuser.register', name='register'),
     
     url(r'^(?P<uid>\d+)/pub/profile/$', 'TBlog.viewsuserprofile.index', name='profile'),

     #文章显示部分
     url(r'^(?P<uid>\d+)/$', 'TBlog.viewsarticle.home', name='userhome'),
     url(r'^(?P<uid>\d+)/category/(?P<cid>\d+)$', 'TBlog.viewsarticle.category', name='articlecategory'),
     url(r'^(?P<uid>\d+)/show/(?P<aid>\d+)$', 'TBlog.viewsarticle.show', name='articleshow'),

     #文章管理部分
     url(r'^(?P<uid>\d+)/pub/article/list/$', 'TBlog.viewsarticle.list',{"cid":0},name='articlelist'),
     url(r'^(?P<uid>\d+)/pub/article/list/draft/$', 'TBlog.viewsarticle.listdraft',name='articlelistdraft'),
     url(r'^(?P<uid>\d+)/pub/article/list/category/(?P<cid>\d+)$', 'TBlog.viewsarticle.listcategory',name='articlelistcategory'),
     url(r'^(?P<uid>\d+)/pub/article/add/$', 'TBlog.viewsarticle.add',name='articleadd'),
     url(r'^(?P<uid>\d+)/pub/article/edit/(?P<aid>\d+)$', 'TBlog.viewsarticle.edit', name='articleedit'),
     url(r'^(?P<uid>\d+)/pub/article/delete/(?P<aid>\d+)$', 'TBlog.viewsarticle.delete', name='articledelete'),

     #分类管理部分
     url(r'^(?P<uid>\d+)/pub/category/$', 'TBlog.viewscategory.index', name='category'),
     url(r'^(?P<uid>\d+)/pub/category/edit/(?P<cid>\d*)$', 'TBlog.viewscategory.edit', name='categoryedit'),
     url(r'^(?P<uid>\d+)/pub/category/delete/(?P<cid>\d*)$', 'TBlog.viewscategory.delete', name='categorydelete'),

     

     #url(r'^pub/add/$', ArticleView, name='add'),
    # url(r'^TBlog/', include('TBlog.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    #url(r'^polls/', include('polls.urls')),
    #
    #url(r'^polls/', include('polls.urls', namespace="polls")),
   
)

#handler404 = 'mysite.views.my_custom_404_view'
#handler500 = 'mysite.views.my_custom_error_view'
#handler403 = 'mysite.views.my_custom_permission_denied_view'

