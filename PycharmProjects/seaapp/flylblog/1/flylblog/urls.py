from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from blog import views
admin.autodiscover()

urlpatterns = patterns('',
    url('^$',views.home),
    # Examples:
    # url(r'^$', 'flybabyblog.views.home', name='home'),
    #url(r'^blog/', include('flylblog.blog.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:

    url(r'^admin/', include(admin.site.urls)),
    url(r'^blog/', include('blog.urls')),
    url(r'^login/$',  'blog.views.login'),
    url(r'^index/$', 'blog.views.index2'),
    url(r'^logout/$', views.logout_view),
    url(r'^about/$', views.about),
    url(r'^regist/$', 'blog.views.regist'),
)
