# Create your views here.

#def year_archive(request, year):
#    a_list = Article.objects.filter(pub_date__year=year)
#    context = {'year': year, 'article_list': a_list}
#    return render(request, '../templates/year_archive.html', context)
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.files.storage import default_storage

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db.models.fields.files import FieldFile
from django.views.generic import FormView
from django.views.generic.base import TemplateView
from django.contrib import messages
from .forms import ContactForm, FilesForm, ContactFormSet
from .models import Blog
from django.http import HttpResponse, Http404
from django.template import loader, Context


# http://yuji.wordpress.com/2013/01/30/django-form-field-in-initial-data-requires-a-fieldfile-instance/
class FakeField(object):
    storage = default_storage


fieldfile = FieldFile(None, FakeField, 'dummy.txt')


#class HomePageView(TemplateView):
#    template_name = 'home.html'
def home(request):
        #context = super(HomePageView, self).get_context_data(**kwargs)
        #messages.info(self.request, 'This is a demo of a message.')
        blogs = Blog.objects.all()
        t = loader.get_template("home.html")
        c = Context({'blogs': blogs})
        return HttpResponse(t.render(c))
def blogdisplay(request,bid):
    try:
        bid = int(bid)
    except ValueError:
        raise Http404
    blogdisp = Blog.objects.get(id=bid).content
    blogtitle = Blog.objects.get(id=bid).title
    blogcreatedate = Blog.objects.get(id=bid).createdate
    dt = loader.get_template("display1.html")
    dc = Context({'blogdisp': blogdisp, 'blogtitle': blogtitle, 'blogcreatedate': blogcreatedate})
    return HttpResponse(dt.render(dc))

def entirety(request):
        #context = super(HomePageView, self).get_context_data(**kwargs)
        #messages.info(self.request, 'This is a demo of a message.')
        blogs = Blog.objects.all()
        t = loader.get_template("entirety.html")
        c = Context({'blogs': blogs})
        return HttpResponse(t.render(c),'bid')

class DefaultFormsetView(FormView):
    template_name = 'formset.html'
    form_class = ContactFormSet


class DefaultFormView(FormView):
    template_name = 'form.html'
    form_class = ContactForm


class DefaultFormByFieldView(FormView):
    template_name = 'form_by_field.html'
    form_class = ContactForm


class FormHorizontalView(FormView):
    template_name = 'form_horizontal.html'
    form_class = ContactForm


class FormInlineView(FormView):
    template_name = 'form_inline.html'
    form_class = ContactForm


class FormWithFilesView(FormView):
    template_name = 'form_with_files.html'
    form_class = FilesForm

    def get_context_data(self, **kwargs):
        context = super(FormWithFilesView, self).get_context_data(**kwargs)
        context['layout'] = self.request.GET.get('layout', 'vertical')
        return context

    def get_initial(self):
        return {
            'file4': fieldfile,
        }

class PaginationView(TemplateView):
    template_name = 'pagination.html'

    def get_context_data(self, **kwargs):
        context = super(PaginationView, self).get_context_data(**kwargs)
        lines = []
        for i in range(10000):
            lines.append('Line %s' % (i + 1))
        paginator = Paginator(lines, 10)
        page = self.request.GET.get('page')
        try:
            show_lines = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            show_lines = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            show_lines = paginator.page(paginator.num_pages)
        context['lines'] = show_lines
        return context


class MiscView(TemplateView):
    template_name = 'misc.html'

