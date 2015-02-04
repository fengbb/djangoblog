from django.conf.urls import patterns, include, url
from django.contrib import admin
from gallery.settings import ROOT_URL

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'gallery.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    #url(r'^admin/', include(admin.site.urls)),
    url(r'^%s' % ROOT_URL[1:], include('gallery.real_urls'))
)
