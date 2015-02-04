import sys
try:
    f = open('thefile.txt')
    s = f.readline()
except IOError:
    print("I/O eror")
except ValueError:
    print("Cound not convert data to an integer.")
finally:
    f.close()
def hcf(x, y):
    "最大公约数"
    a = x
    b = y
    r = a%b
    while r != 0:
        a = b
        b = r
        r = a % b
    return b
print(hcf(319, 377))

def ask_ok(prompt, retries=4, complaint=' Yes or no, please!'):
    while True:
        ok=input(prompt)
        if ok in ('y', 'ye', 'yes'): return True
        if ok in ('n', 'no', 'nop', 'nope'): return  False
        retries = retries - 1
        if retries < 0 : raise IOError('refusenik user')
        print(complaint)

#ask_ok('ok')
def foo(a, b, x=1, y=1):
    return a*x + b*y
print(foo(6, 7))
print(foo(6, 7, 4, 2))
print(foo(6, 7, 4))
print(foo(2, 5, y=9))
args = [5, 25, 5]
b = list(range(*args))
print(b)
print(list(range(*args)))
def fol(*args):
    return args
print(fol(*[3, 3, 2]))
def fool(**args):
    return args
print(fool(a=1, b=2, c=3))
print(fool(**{'a':1, 'b':2, 'c':3}))
f = lambda  x, y:x**2+y**2
print(f(20, 5))
class c(object):
    def foo(self, a, b):
        return a % b
o = c()
print(o.foo(5, 2))
class vector3(object):
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z
    def __abs__(self):
        return (self.x**2 + self.y**2 + self.z**2)**(.5)
v = vector3(1, 1, 1)
print(abs(v))
import os.path
print(os.path)

