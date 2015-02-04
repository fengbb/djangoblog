from __future__ import unicode_literals
from django.conf.urls import patterns, url
from django.views.generic import TemplateView
from blog import views
from django.contrib import admin
#urlpatterns = patterns('',
    #(r'^articles/(\d{4})/$', views.year_archive),
    #(r'^/$', views.index)
  #  (r'^articles/(\d{4})/(\d{2})/$', views.month_archive),
 #   (r'^articles/(\d{4})/(\d{2})/(\d+)/$', views.article_detail),
#)
urlpatterns = patterns('',
    url(r'^$',  views.home),
    url(r'^(\d{0,10})/$', views.blogdisplay),
    url(r'^(\d{0,10})/comment/$', views.comment),
    #url(r'^comment$', views.create_comment),
    url(r'^blog/success$', TemplateView.as_view(template_name='register_success.html')),
    url(r'^register$', views.register),
    url(r'^static/(?P<path>.*)', 'django.views.static.serve', {'document_root': 'E:\PycharmProjects\dgangotest\static'}),
    url(r'^requesttest$', views.dsiplay_meta),
    url(r'^contact$', views.contact),
    #url(r'^search_form/$', search_form),
    url(r'^search/$',views.search),
    #url(r'^test$',views.test)
)

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'loginsesion.views.home', name='home'),
    # url(r'^loginsesion/', include('loginsesion.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^$',  views.home),
    url(r'^(\d{0,10})/$', views.blogdisplay),
    #url(r'^comment/(\d{0,10})/$',  TemplateView.as_view(template_name='comment.html')),
    #url(r'^comment/$', views.comment, {'template_name': 'comment.html'}),
    url(r'^(\d{0,10})/comment/$', 'blog.views.comment'),
    url(r'^regist/$', 'blog.views.regist'),
    #url(r'^$', 'blog.views.login_view', name="home"),
    url(r'^login/$',  'blog.views.login'),
    url(r'^index/$', 'blog.views.index2'),
    url(r'^logout/$', views.logout_view),
    url(r'^about/$', views.about),
)