"""
ASGI config for client project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/asgi/
"""

import os
from django.core.asgi import get_asgi_application
from django.urls import path
from channels.routing import ProtocolTypeRouter, URLRouter

# consumers
from users.consumers import (
    UpdateUserCurrentLocationCOnsumer,
)


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'client.settings')
url_paths = [
    path("ws/user_location/", UpdateUserCurrentLocationCOnsumer.as_asgi()),
]
application = ProtocolTypeRouter(
    {
        "http": get_asgi_application(),
        "websocket": URLRouter(url_paths)
    }
)
