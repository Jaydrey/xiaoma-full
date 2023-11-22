from django.urls import path, include

from rest_framework.routers import DefaultRouter

# views
from .views import (
    TripViewSet,
    CancellationReasonViewSet,
)

router = DefaultRouter()
router.register(r'trips', TripViewSet)
router.register(r'cancellation-reasons', CancellationReasonViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
