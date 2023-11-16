from django.urls import path

# views
from .views import (
    LoginAPIView,
    RegistrationAPIView,
    ActivateAccountAPIView,
    ValidateEmailAPIView,
    ValidatePhoneNumberAPIView,
)

urlpatterns = [
    path('login/', LoginAPIView.as_view(), name='login'),
    path('register/', RegistrationAPIView.as_view(), name='register'),
    path('activate-account/', ActivateAccountAPIView.as_view(), name='activate-account'),
    path('validate-email/', ValidateEmailAPIView.as_view(), name='validate-email'),
    path('validate-phonenumber/', ValidatePhoneNumberAPIView.as_view(), name='validate-phonenumber'),
]
