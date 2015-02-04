__author__ = 'Administrator'
from PIL import Image, ImageFilter
#import Image
#fp = open(r"E:\PycharmProjects\gallery\items\1.jpg")
im = Image.open('test.jpg')
im2 = im.filter(ImageFilter.BLUR)
im2.save('blur.jpg', 'jpeg')