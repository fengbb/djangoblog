from django.conf.urls import patterns, include, url
import gallery
from gallery.settings import ROOT_URL
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'gallery.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^%s/' % ROOT_URL[1:], include('photo.real_urls')),
)
