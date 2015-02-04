__author__ = 'Administrator'
from django import template
register = template.Library()
import re
import sys
class SetVarNode(template.Node):

    def __init__(self, var_name, var_value):
        self.var_name = var_name
        self.var_value = var_value

    def render(self, context):
        try:
            value = template.Variable(self.var_value).resolve(context)
        except template.VariableDoesNotExist:
            value = ""
        context[self.var_name] = value
        return u""
def truncatewords(s,num,end_text='...'):

    re_tag= re.compile(r'<(/)?([^ ]+?)(?: (/)| .*?)?>')
    re_words = re.compile(u'(&.*?;)|[\u4e00-\u9fa5]{1}|[^\u4e00-\u9fa5]{1}',re.UNICODE)

    s = force_unicode(s)

    length=int(num)

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

        m= re_tag.search(s,pos)
        if not m:
            break
        pos = m.end()

        while words <= length:
            if words==length:
                break
            m = re_words.search(s,pos)
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

    out+=end_text
    return out
register.tag('cutstr', truncatewords)
