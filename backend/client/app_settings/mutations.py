from graphene_django.rest_framework.mutation import SerializerMutation

# serialzers
from .serializers import (
    AppSettingsSerializer,
    LanguagesSerializer,
    RideContactSerializer,
    CreateAppSettingSerializer,
    CreateLanguageSerializer,
    CreateRideContactSerializer,
)


class CreateAppSettingsMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateAppSettingSerializer
        model_operations = ("create",)


class CreateLanguageMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateLanguageSerializer
        model_operations = ("create",)


class CreateRideContactMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateRideContactSerializer
        model_operations = ("create",)



