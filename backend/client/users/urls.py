from django.urls import path, include

from rest_framework.routers import DefaultRouter

# views
from .views import (
    UserViewSet,
    UpdateFullNameAPIView
)

router = DefaultRouter()
router.register(r'users', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('users/update-fullname/<str:id>/', UpdateFullNameAPIView.as_view(), name='update-name'),
]

