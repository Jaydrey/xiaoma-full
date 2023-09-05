from graphene_django.rest_framework.mutation import SerializerMutation

# serializers
from .serializers import (
    CreateTripSerializer,
    CreateTripStatusSerializer,
    CreateCancellationReasonSerializer,
    UpdateTripSerializer,
)

# models
from .models import (
    Trip, 
    TripStatus, 
    CancellationReason,
)


class CreateTripMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateTripSerializer
        model_operations = ("create",)


class CreateTripStatusMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateTripStatusSerializer
        model_operations = ("create",)


class CreateCancellationReasonMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateCancellationReasonSerializer
        model_operations = ("create",)


class UpdateTripMutation(SerializerMutation):
    class Meta:
        serializer_class = UpdateTripSerializer
        model_operations = ("update",)