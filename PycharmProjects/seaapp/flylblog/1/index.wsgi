import sae
from flylblog import wsgi

application = sae.create_wsgi_app(wsgi.application)
