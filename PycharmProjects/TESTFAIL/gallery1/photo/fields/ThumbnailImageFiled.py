__author__ = 'Administrator'
from django.db.models.fields.files import ImageField, ImageFieldFile,FieldFile
from PIL import Image
import os


def _add_thumb(s):
    """
    :param s:
    :return:
    """
    parts = s.split(".")
    parts.insert(-1, "thumb")
    if parts[-1].lower() not in ['jpeg', 'jpg']:
        parts[-1] = 'jpg'
    return ".".join(parts)


class ThumbnailImageFieldfile(object):
    pass


class ThumbnailImageField(ImageField):
    attr_class = ThumbnailImageFieldfile
    def _get_thumb_path(self):
        return _add_thumb(self.path)
    thumb_path = property(_get_thumb_path)
    def _get_thumb_url(self):
        return _add_thumb(self.url)
    thumb_url = property(_get_thumb_url)

def __init__(self, thumb_width=128,thumb_height=128, *args, **kwargs):
    self.thumb_width = thumb_width
    self.thum_height = thumb_height
    super(ThumbnailImageField, self).__init__(*args, **kwargs)
def save(self, name, connect, save=True):
    super(ThumbnailImageField,self).save(name, content, save)
    img = Image.open(self.path)
    img.thumbnail(
        (self.field.thumb_width,self.field.thumb_height),
    )
    img.save(self.thumb_path, 'JPEG')
def delete(self,save=True):
    if os.path.exists(self.thumb_path):
        os.remove(self.thumb_path)
    super(ThumbnailImageField,self).delete(save)
