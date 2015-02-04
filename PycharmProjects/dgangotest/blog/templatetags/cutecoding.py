__author__ = 'Administrator'
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
from django import template
register = template.Library()
from django.utils.text import Truncator
from django.utils.encoding import force_unicode
import re




def cut_str(str, length=10):


    is_encode = False
    try:
        str_encode = str.encode('gb18030')
        is_encode = True
    except:
        pass
    if is_encode:
        l = length*2
        if l < len(str_encode):
            l = l - 3
            str_encode = str_encode[:l]
            try:
                str = str_encode.decode('gb18030') + '...'
            except:
                str_encode = str_encode[:-1]
                try:
                    str = str_encode.decode('gb18030') + '...'
                except:
                    is_encode = False
    if not is_encode:
        if length < len(str):
            length = length - 2
            return str[:length] + '...'
    return str
#    return Truncator(out).words(length, truncate=' ...')
register.filter('cut', cut_str)