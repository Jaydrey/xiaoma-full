from django.urls import path, include
from rest_framework.routers import DefaultRouter

# views
from .views import (
    LanguageViewSet,
    ContactViewSet,
    AppSettingViewSet
)

router = DefaultRouter()
router.register(r'languages', LanguageViewSet)
router.register(r'contacts', ContactViewSet)
router.register(r'settings', AppSettingViewSet)

urlpatterns = [
    path('', include(router.urls)),
]

