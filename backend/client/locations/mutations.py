from graphene_django.rest_framework.mutation import SerializerMutation

# serializers
from .serializers import (
    CreateSavedLocationSerializer,
)


class CreateSavedLocationMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateSavedLocationSerializer
        model_operations = ("create",)
