from django.conf.urls import *
from django.contrib.sites import admin
from gallery.settings import ROOT_URL
urlpatterns = patterns('',
    url(r'^admin/(.*)', admin.Site),
    url(r'^', include('gallery.urls')),

    #url(r'^admin/', include(admin.site.urls)),
    #url(r'^%s/' % ROOT_URL[1:], include(gallery.real.urls)),
)