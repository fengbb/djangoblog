from django.db import models
from django.contrib import admin

# Create your models here.
class User(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=20)
    password = models.CharField(max_length=20)
    realname = models.CharField(max_length=255)
    sex = models.CharField(max_length=10)
    email = models.EmailField(blank=True)
    def __str__(self):
        return '%s ' %(self.username)

class Author(models.Model):
    authorname = models.CharField(max_length=20)
    email = models.EmailField(blank=True)
    def __str__(self):
        return '%s' %(self.authorname)
class Blog(models.Model):
    title = models.CharField(max_length=50)
    summary = models.CharField(max_length=200)
    content = models.TextField()
    authors = models.ManyToManyField(Author)
    createdate = models.DateTimeField()
    def __str__(self):
        return '%s' %(self.title)
    class Meta:
        ordering = ['-createdate']
#admin.site.register((Users, Author, blog))