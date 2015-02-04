__author__ = 'Administrator'
print('hello')
print(1+1j + 3)
print((4j)*5)
print((6+4j)*(-6+2j))
from decimal import  Decimal
x = Decimal(1)
y = Decimal(3)
print(x/y)
print(y**6)
l = ['a',2,[6,7,8]]
print(l[2])
print(list(range(2, 12, 2)))
s = 'abcdefghijklmnopqrstuvwxyz'
a = s
a += 'adc'
print(a)
print(s)
print(id(s))
print(id(a))
l = [ 'a','b','c','d' ]
x = l[:]
x += ['a','b','c','d' ]
print(l)
print(x)
a = [66.25,333,333,1,1234.5]
print(a.count(333),a.count(66.25),a.count('x'))
a.insert(2,-1)
a.append(333)
print(a)
print(a.index(333))
a.remove(333)
print(a)
a.reverse()
print(a)
a.sort()
a.reverse()
print(a)
stack = [3, 4, 5]
stack.append(6)
stack.append(7)
print(stack)
print(stack.pop())
print(stack)
queue = ["Eric", "John", "Michael"]
queue.append("Jack")
queue.append("Tom")
print(queue)
queue.pop()
print(queue)
queue.pop(0)
print(queue)
print(s)
l = [c for c in s]
print(l)
types = [list, set, tuple, dict]
haskey = [t for t in types if hasattr(t, 'has_key')]
print(haskey)
l = [x**2 for x in range(10)]
print(l)
l = [(x, y, x*y) for x in range(1, 10) for y in range(1, 10) if x >= y]
print(l)
tu = (1, 2, 3, 4, 5)
print(tu)
print(type(tu))
x = tuple([235, 224 ,120])
print(x)
x = tuple(x**2 for x in range(1, 4))
print(x)
y = x
print(id(x))
print(id(y))
x += (6,)
print(x)
print(id(x))
print(id(y))
a = 10
b = 15
print(a)
print(b)
a, b = b, a
print(a)
print(b)
basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
fruit = set(basket)
print(basket)
print(fruit)
print('orange' in fruit)
print('crabgrass' in fruit)
a = set('abracadabdasdjk')
b = set('alacaczam')
print(a)
print(a - b)
print(a | b)
print(a & b)
print(a ^ b)
d = dict((chr(x), x) for x in range(ord('a'), ord('z')+1))
print(d)
for k, v in d.items():
    print(k, v)
for k in sorted(d.keys()):
    print(k, d[k])
x = int(input('请输入一个整数：'))
if x % 3 == 0:
    print('x能被3整除')
elif x % 4 == 0:
    print('x能被4整除')
elif x % 5 == 0:
    print('x能被5整除')
else:
    print('what fuck you what do')

