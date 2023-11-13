from django.urls import path, include
from rest_framework.routers import DefaultRouter

# views
from .views import (
    StatusViewSet,
    AccountViewSet
)

router = DefaultRouter()
router.register(r'statuses', StatusViewSet)
router.register(r'accounts', AccountViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
