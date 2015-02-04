from django.conf.urls import patterns, url
from blog.views import archive

urlpatterns = patterns('',
                       url(r'^$', archive),
)
