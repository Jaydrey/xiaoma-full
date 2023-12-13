from rest_framework import status
from rest_framework.request import Request
from rest_framework.response import Response

from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView

from rest_framework.permissions import AllowAny

# serializers
from .serializers import (
    TripSerializer,
    CancellationReasonSerializer,
)

# models
from .models import (
    CancellationReason,
    Trip,
)


class TripViewSet(ModelViewSet):
    queryset = Trip.objects.all()
    serializer_class = TripSerializer

class CancellationReasonViewSet(ModelViewSet):
    queryset = CancellationReason.objects.all()
    serializer_class = CancellationReasonSerializer


    