#-*- coding: utf-8 -*-
# Create your views here.

#def year_archive(request, year):
#    a_list = Article.objects.filter(pub_date__year=year)
#    context = {'year': year, 'article_list': a_list}
#    return render(request, '../templates/year_archive.html', context
from __future__ import unicode_literals
from django.core.files.storage import default_storage
from django.contrib import auth

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db.models.fields.files import FieldFile
from django.views.generic import FormView
from django.views.generic.base import TemplateView
from django.contrib import messages
from forms import *
from models import *
from django.http import HttpResponse, Http404
from django.template import loader, Context
from blog import cutstr
from django.shortcuts import render_to_response, get_object_or_404, render
from django.core.mail import send_mail
from django.http import HttpResponseRedirect
from django.template import RequestContext
from django.views.generic.base import TemplateView
import datetime, random, sha
from django.core.mail import send_mail
from django.db.models import Count
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required



# http://yuji.wordpress.com/2013/01/30/django-form-field-in-initial-data-requires-a-fieldfile-instance/
class FakeField(object):
    storage = default_storage


fieldfile = FieldFile(None, FakeField, 'dummy.txt')


#class HomePageView(TemplateView):
#    template_name = 'home.html'
def contact(request):
    errors = []
    if request.method == 'POST':
        if not request.POST.get('subject', ''):
            errors.append('Enter a subject.')
        if not request.POST.get('message', ''):
            errors.append('Enter a message.')
        if request.POST.get('email') and '@' not in request.POST['email']:
            errors.append('Enter a valid e-mail address')
        if not errors:
            send_mail(
                request.POST['subject'],
                request.POST['message'],
                request.POST.get('email', '122727569@qq.com'),
                ['15353531182@163.com'],
            )
            return HttpResponseRedirect('thanks')
    return render_to_response('contact_form.html', {
         'errors': errors,
         'subject': request.POST.get('subject', ''),
         'message': request.POST.get('message', ''),
         'email': request.POST.get('email', ''),
         })
def home(request):
        username = request.session.get('username','')
        blogs = Blog.objects.all()
        nblogs = Blog.objects.all()[0:5]
        #cblog = Comments.objects.aggregate(blogn=Count('blogid'))
        cblog = Comments.objects.values("blogid").annotate(Count("id")).order_by()
        #cblog1 = cblog[0].blogcn
        #cblog = Comments.objects.distinct().values('blogid')
        hblogs = Blog.objects.order_by("-hits")[0:5]
        t = loader.get_template("home.html")
        c = Context({'username': username,'cblog': cblog, 'blogs': blogs, 'nblogs': nblogs, 'hblogs': hblogs})
        return HttpResponse(t.render(c))

def base(request):
    hblogs = Blog.objects.order_by("hits")[0:5]
    t = loader.get_template("base.html")
    c = Context({'hblogs': hblogs})
    return HttpResponse(t.render(c))

#@login_required
def blogdisplay(request, bid):
    username = request.session.get('username','')
    try:
        bid = int(bid)
    except ValueError:
        raise Http404
    blogs = Blog.objects.all()
    #nblogs = Blog.objects.all().values("createdate")
    nblogs = Blog.objects.all()[0:5]
    hblogs = Blog.objects.order_by("-hits")[0:5]
    blogInfo = Blog.objects.get(id=bid)
    blogid = blogInfo.id
    blogdisp = blogInfo.content
    blogtitle = blogInfo.title
    blogcreatedate = blogInfo.createdate
    blogauthor = blogInfo.authors
    blogreads = blogInfo.readnumber
    bloghits = blogInfo.hits
    blogk = blogInfo.keyword
    blogInfo.readnumber += 1
    blogInfo.hits += 1
    blogInfo.save()
    cf = CommentForm()


    comments1 = Comments.objects.filter(blogid=bid)
    #for comments1 in Comments.objects.filter(blogid=bid):
    #    commname = comments1.cname
    #    commdate = comments1.cdate
    #    commentnr = comments1.comment
    if request.method != 'GET':
        if request.method == 'POST':
            if username != '':
                cf = CommentForm(request.POST)
                if cf.is_valid():
                    #cname = cf.cleaned_data['cname']
                    cname = request.session.get('username')
                    blogid = Blog.objects.get(id=bid).id
                    #blogid = request.GET['bid']
                    #blogid = cf.cleaned_data['blogid']
                    comment = cf.cleaned_data['comment']
                    cdate = datetime.datetime.now()
                    Comments.objects.create(cname=cname, blogid=blogid, comment=comment, cdate=cdate)
                    return HttpResponseRedirect('')
            else:
                #emsg = "您尚未登录，请登录后发表评论"
                #dts = loader.get_template("display1.html")
                #dcs = Context({'emsg':emsg})

                #return HttpResponse(dts.render(dcs))
                return HttpResponseRedirect('/blog/login')
                #return HttpResponseRedirect('/blog/login', {'emsg':emsg})
            #cf = CommentForm()
    #return HttpResponseRedirect('/blog/commant/{{bid}}')
        #return render_to_response('display1.html', {'cf': cf})
    else:
        dt = loader.get_template("display1.html")
        dc = Context({'username': username,'cf': cf, 'blogk': blogk,'blogid': blogid, 'comments1': comments1, 'blogs': blogs, 'blogdisp': blogdisp, 'blogtitle': blogtitle, 'blogcreatedate': blogcreatedate, 'blogauthor': blogauthor, 'blogreads': blogreads, 'bloghits': bloghits, 'nblogs': nblogs, 'hblogs': hblogs})
        return HttpResponse(dt.render(dc))
def register(request):
    if request.user.is_authenticated():
        return render_to_response('register.html', {'has_account': True})
    manipulator = RegistrationForm()
    if request.POST:
        new_data = request.POST.copy()
        errors = manipulator.get_validation_errors(new_data)
        if not errors:
            manipulator.do_html2python(new_data)
            new_user = manipulator.save(new_data)
            salt = sha.new(str(random.random())).hexdigest()[:5]
            activation_key = sha.new(salt+new_user.username).hexdigest()
            key_expires = datetime.datetime.today() + datetime.timedelta(2)
            new_profile = UserProfile(user=new_user,
                                      activation_key=activation_key,
                                      key_expires=key_expires)
            new_profile.save()
            email_subject = '用户注册信息确认'
            email_body = "您好, %s, 欢迎您注册 \n\n 点击一下链接，激活您的账号，有效时间48小时 \hours:\n\nhttp://example.com" % (
                new_user.username,
                new_profile.activation_key
            )
            send_mail(email_subject,
                      email_body,
                      'accounts@example.com',
                      [new_user.email])
            return render_to_response("register.html", {'created': True})
        else:
            errors = new_data = {}
        form = forms.FormWrapper(manipulator, new_data, errors)
        return render_to_response("register.html", {'form': form})

def confirm(request, activation_key):
    if request.user.is_authenticated():
        return render_to_response("confirm.html", {'has_account': True})
    user_profile = get_object_or_404(UserProfile,
                                     activation_key=activation_key)
    if user_profile.key_expires < datetime.datetime.today():
        return render_to_response("confirm.html", {'expired': True})
    user_account = user_profile.user
    user_account.is_active = True
    user_account.save()
    return  render_to_response("confirm.html", {'success': True})
def dsiplay_meta(request):
    values = request.META.items()
    values.sort()
    html = []
    for k, v  in values:
        html.append('<tr><td>%s</td><td>%s</td></tr>' % (k, v))
        return HttpResponse('<table>%s</table>' % '\n'.join(html))
#def search_form(request):
#    return render_to_response('search_form.html')
def search(request):
    errors = []
    if 'q' in request.GET:
        q = request.GET['q']
        if not q:
            errors.append('Enter a search term.')
        elif len(q) > 20:
            errors.append('Please enter at most 20 characters.')
        else:
            blogs = Blog.objects.filter(title__icontains=q)
            return render_to_response('search_results.html',
                {'blogs': blogs, 'query': q})
    return render_to_response('search_form.html',{'errors': errors})
       #return HttpResponse('Please submit a search term.')
#评论
def comment(req,bid):
    try:
        bid = int(bid)
    except ValueError:
        raise Http404
    if req.method == 'POST':
        cf = CommentForm(req.POST)
        if cf.is_valid():
            cname = cf.cleaned_data['cname']
            blogid = cf.cleaned_data['blogid']
            comment = cf.cleaned_data['comment']
            cdate = datetime.datetime.now()
            Comments.objects.create(cname=cname, blogid=blogid, comment=comment, cdate=cdate)
            return HttpResponseRedirect('..')
    else:
        cf = CommentForm()
    #return HttpResponseRedirect('/blog/commant/{{bid}}')
    return render_to_response('comment.html', {'cf': cf})



def regist(req):
    if req.method == 'POST':
        #urf = RegistrationForm(req.POST)
        urf = UserRegistForm(req.POST)
        if urf.is_valid():
            username = urf.clean_user['username']
            password = urf.cleaned_data['password']
            #password2 =  urf.cleaned_data['password2']
            email = urf.clean_email['email']
            User.objects.create(username=username, password=password, email=email)
            return render_to_response('register_success.html')
    else:
        urf = UserRegistForm()
    return render_to_response('regist.html', {'urf': urf})

def login(request):
    if request.method == 'GET':
        request.session['login_form'] =  request.META.get('HTTP_REFERER', '/')
    if request.method == 'POST':
        uf = UserForm(request.POST)
        if uf.is_valid():
            username = uf.cleaned_data['username']
            password = uf.cleaned_data['password']
            #user = auth.authenticate(username=username, password=password)
            user = User.objects.filter(username__exact = username, password__exact = password)
            if user is not None:
                #auth.login(request, user)
                #print request.user
                request.session['username'] = username
                #lt = loader.get_template('home.html')
                #c = RequestContext(request,{'user':user})
                return HttpResponseRedirect(request.session['login_form'])
                #return home(request)
                #return HttpResponse(lt.render(c))
                #return render(request, 'home.html', context_instance=RequestContext(request))
            else:
                #验证失败，暂时不做处理
                return HttpResponseRedirect('/blog/login')
                #return HttpResponseRedirect("/blog/invalid")
#            user = User.objects.filter(username__exact = username, password__exact = password)
#            if user:
#                req.session['username'] = username
#                return HttpResponseRedirect('/blog')
#            else:
#                return HttpResponseRedirect('/blog/login/')
    else:
        uf = UserForm()
    return render_to_response('login.html', {'uf': uf})

def index2(req):
    username = req.session.get('username', 'anybody')
    return render_to_response('index2.html', {'username': username})

#def logout(req):
#    session = req.session.get('username', False)
#    if session:
#        del req.session['username']
#        return render_to_response('logout.html', {'username': session})
#    else:
#        return HttpResponse('please login!')
def login_view(request):
    username = request.POST.get('username', '')
    password = request.POST.get('password', '')
    user = auth.authenticate(username=username, password=password)
    if user is not None and user.is_active:
        auth.login(request, user)
        print request.user
        lt = loader.get_template('base.html')
        c = RequestContext(request,{'user':user})
        #return home(request)
        return HttpResponseRedirect("/blog/loggedin")
    else:
        #验证失败，暂时不做处理
        return HttpResponseRedirect("/blog/invalid")

def logout_view(request):
    session = request.session.get('username', False)
    if session:
        del request.session['username']
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
        #return render_to_response('logout.html',{'username':session})
    else:
        return HttpResponse('请您先登录')

def about(request):
    return render_to_response("author1.html")


