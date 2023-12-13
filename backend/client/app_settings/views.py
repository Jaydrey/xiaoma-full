from rest_framework.viewsets import ModelViewSet

# models
from .models import (
    Language,
    Contact,
    AppSetting,
)
from .serializers import (
    LanguagesSerializer,
    ContactsSerializer,
    AppSettingsSerializer,
)
# serializers



class LanguageViewSet(ModelViewSet):
    queryset = Language.objects.all()
    serializer_class = LanguagesSerializer

class ContactViewSet(ModelViewSet):
    queryset = Contact.objects.all()
    serializer_class = ContactsSerializer


class AppSettingViewSet(ModelViewSet):
    queryset = AppSetting.objects.all()
    serializer_class = AppSettingsSerializer

    
