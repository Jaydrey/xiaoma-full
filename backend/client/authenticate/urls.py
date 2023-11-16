from django.urls import path

# views
from .views import (
    LoginAPIView,
    RegistrationAPIView,
    ActivateAccountAPIView,
    ValidateEmailAPIView
)

urlpatterns = [
    path('login/', LoginAPIView.as_view(), name='login'),
    path('register/', RegistrationAPIView.as_view(), name='register'),
    path('activate-account/', ActivateAccountAPIView.as_view(), name='activate-account'),
    path('validate-email/', ValidateEmailAPIView.as_view(), name='validate-email'),
]
