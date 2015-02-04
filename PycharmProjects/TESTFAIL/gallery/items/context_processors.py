
from gallery.settings import ROOT_URL
def auth(request):
    if hasattr(request, 'user'):
        user = request.user
    else:
        from django.contrib.auth.models import AnonymousUser
        user = AnonymousUser()
    return {
        'user': user,
        'perms': PermWrapper(user),
    }





def root_url_processor(request):
    return {'ROOT_URL': ROOT_URL}