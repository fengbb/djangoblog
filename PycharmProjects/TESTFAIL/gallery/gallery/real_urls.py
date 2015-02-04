from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()
from gallery.settings import ROOT_URL
urlpatterns = patterns('',
                       #url(r'^admin/(.*)', admin.site.root),
                       url(r'^admin/', include(admin.site.urls)),
                       url(r'^', include('gallery.items.urls')),
                       )
