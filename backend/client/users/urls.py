from django.urls import path, include

from rest_framework.routers import DefaultRouter

# views
from .views import (
    UserViewSet,
    GenderViewSet,
)

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'genders', GenderViewSet)

urlpatterns = [
    path('', include(router.urls)),
]

