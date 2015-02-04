#-*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
from django import template
register = template.Library()
from django.utils.text import Truncator
from django.utils.encoding import force_unicode
import re


def truncatewords(value, arg):

    re_tag= re.compile(r'<(/)?([^ ]+?)(?: (/)| .*?)?>')
    re_words = re.compile(u'(&.*?;)|[\u4e00-\u9fa5]{1}|[^\u4e00-\u9fa5]{1}',re.UNICODE)

    value = force_unicode(value)

    length = int(arg)

    if length<=0:
        return u''

    pos = 0
    words=0
    data=[]
    out=''
    current_word = ''
    while words <= length:
        if words==length:
            break

        m= re_tag.search(value,pos)
        if not m:
            break
        pos = m.end()

        while words <= length:
            if words==length:
                break
            m = re_words.search(value,pos)
            if not m:
                break
            current_word = m.group()
            if current_word=='<':
                break
            else:
                if not m.group(1):
                    words+=1
                    data.append(str(m.group()))
                    pos+=1
                else:
                    words+=1
                    data.append(str(m.group()))
                    pos=m.end()

    out = ''.join(data)

    return Truncator(out).words(length, truncate=' ...')
register.filter('cutstr', truncatewords)
