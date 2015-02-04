from django.conf.urls import patterns, include, url
import django.contrib

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(django.contrib.admin.site.urls)),
)
