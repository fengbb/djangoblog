from django.db import models
from django.contrib import admin

# Create your models here.
class BlogPost(models.Model):
    title = models.CharField(max_length=150)
    body = models.TextField()
    timestamp = models.DateTimeField()
class BlogPostAdmin(admin.ModelAdmin):
    list_display = ('title', 'timestamp')
admin.site.register(BlogPost, BlogPostAdmin)
class Meta:
    ordering = ('-timestamp',)
sex_choices =(
    ('f', 'famale'),
    ('m', 'male ')
)
class User(models.Model):
    name = models.CharField(max_length=20)
    sex = models.CharField(max_length=1, choices=sex_choices)
class UserAdmin(admin.ModelAdmin):
    list_display = ('name','sex')
admin.site.register(User, UserAdmin)
'''class Author(models.Model):
    name = models.CharField(max_length=100)
class Book(models.Model):
    title = models.CharField(max_length=100)
    author = models.ManyToManyField(Author)
    length = models.IntegerField()

class Person(models.Model):
    first = models.CharField(max_length=100)
    last = models.CharField(max_length=100)
    middle = models.CharField(max_length=100,blank=True)
    class Meta:
        ordering = {'last','first','middle'}
        unique_together = ['first', 'last', 'middle']
        verbose_name_plural = 'people'
'''