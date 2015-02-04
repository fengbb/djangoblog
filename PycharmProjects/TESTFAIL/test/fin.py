__author__ = 'Administrator'

import sys
import os
logsize = os.popen('du -sh *').read()
print(logsize)
book = ['python', 'hello']
print(book.sorted())