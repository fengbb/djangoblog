__author__ = 'Administrator'
import re
import sys
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