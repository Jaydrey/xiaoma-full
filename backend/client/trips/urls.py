from django.urls import path, include

from rest_framework.routers import DefaultRouter

# views
from .views import (
    TripViewSet,
    CancellationReasonViewSet,
    TripStatusViewSet
)

router = DefaultRouter()
router.register(r'trips', TripViewSet)
router.register(r'cancellation-reasons', CancellationReasonViewSet)
router.register(r'trip-status', TripStatusViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
