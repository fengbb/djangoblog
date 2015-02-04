from __future__ import unicode_literals

from django.conf.urls import patterns, url

from .views import home, entirety, blogdisplay, FormHorizontalView, FormInlineView, PaginationView, FormWithFilesView, DefaultFormView, MiscView, DefaultFormsetView, DefaultFormByFieldView
#urlpatterns = patterns('',
    #(r'^articles/(\d{4})/$', views.year_archive),
    #(r'^/$', views.index)
  #  (r'^articles/(\d{4})/(\d{2})/$', views.month_archive),
 #   (r'^articles/(\d{4})/(\d{2})/(\d+)/$', views.article_detail),
#)
urlpatterns = patterns('',
    url(r'^$',  home),
    url(r'^(\d{0,10})/$', blogdisplay),
    url(r'^entirety$', entirety),
    url(r'^form$', DefaultFormView.as_view(), name='form_default'),
    url(r'^form_by_field$', DefaultFormByFieldView.as_view(), name='form_by_field'),
    url(r'^form_horizontal$', FormHorizontalView.as_view(), name='form_horizontal'),
    url(r'^form_inline$', FormInlineView.as_view(), name='form_inline'),
    url(r'^form_with_files$', FormWithFilesView.as_view(), name='form_with_files'),
    url(r'^pagination$', PaginationView.as_view(), name='pagination'),
    url(r'^misc$', MiscView.as_view(), name='misc'),
    #url(r'^test$',views.test)
)
