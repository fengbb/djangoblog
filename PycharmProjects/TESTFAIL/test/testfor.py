__author__ = 'Administrator'
#l = [1, 2, 4, 8, 16]
#for i in l:#
#    print(i)
#l = [1, 2, 4, 8, 16]
#for i in range(len(l)):
#    print(l[i])
#print(range(10))
#for i in range(10):
#    print(i)
def  prtfoo(its):
    for it in its:
        print(it)
prtfoo(i for i in range(5,20,3))
s =  'abserwroh'
for c in s:
    if c == 'b':
        print('find')
        break
    else:
        print('no')
