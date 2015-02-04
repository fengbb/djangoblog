from django.db import models
from django.contrib import admin
from photo.fields import ThumbnailImageFiled
from django.db.models import permalink
from gallery.settings import ROOT_URL


class Item(models.Model):
    name = models.CharField(max_length=250)
    description = models.TextField()

    class Meta:
        ordering = ['name']
    def __unicode__(self):
        return u'%s' % self.name


    @permalink
    def get_absolute_url(self):
        return {'item_detail', None, {'object_id': self.id}}


class Photo(models.Model):
    item = models.ForeignKey(Item)
    title = models.CharField(max_length=100)
    image = models.ImageField(upload_to='photos')
    caption = models.CharField(max_length=250, blank=True)

    class Meta:
        ordering = ['title']

class PhotoAdmin(admin.ModelAdmin):
    list_display = ('title',)

    @permalink
    def get_absolute_url(self):
        return {'photo_detail', None, {'object_id': self.id}}


class PhotoInline(admin.StackedInline):
    model = Photo


class ItemAdmin(admin.ModelAdmin):
    inlines = [PhotoInline]
admin.site.register(Item, ItemAdmin)
admin.site.register(Photo, PhotoAdmin)
def root_url_processor(request):
    return {'ROOT_URL': ROOT_URL}