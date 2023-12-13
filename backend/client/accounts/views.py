from rest_framework import status
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import action

# serializers
from .serializers import (
    StatusSerializer,
    AccountSerializer,
    RenewPasswordSerializer
)

# models
from .models import (
    Status,
    Account
)
from users.models import User

class StatusViewSet(ModelViewSet):
    queryset = Status.objects.all()
    serializer_class = StatusSerializer


class AccountViewSet(ModelViewSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer

    def get_serializer_class(self):
        if self.action == "renew_password":
            return RenewPasswordSerializer
        return super().get_serializer_class()
    
    def get_queryset(self):
        if self.action == "renew_password":
            return User.objects.all()
        return super().get_queryset()

    @action(detail=True, methods=['put'])
    def renew_password(self, request, pk=None):
        data:dict = request.data
        user: User = self.get_object()
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        password = serializer.validated_data.get("password")
        user.set_password(password)
        user.save()
        # send an email
        return Response(status=status.HTTP_200_OK)
    
