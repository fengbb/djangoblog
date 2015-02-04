from django.conf.urls import patterns, include, url
from django.contrib import admin
from blog import views
admin.autodiscover()

urlpatterns = patterns('',
                       url('^$',views.home),
    # Examples:
    # url(r'^$', 'dgangotest.views.home', name='home'),
    url(r'^blog/', include('blog.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^login/$',  'blog.views.login'),
    url(r'^index/$', 'blog.views.index2'),
    url(r'^logout/$', views.logout_view),
    url(r'^about/$', views.about),
    url(r'^regist/$', 'blog.views.regist'),
)
