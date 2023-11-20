from rest_framework import status
from rest_framework.request import Request
from rest_framework.response import Response

from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView

from rest_framework.permissions import AllowAny


from rest_framework_simplejwt.tokens import RefreshToken

# views
from rest_framework_simplejwt.views import TokenObtainPairView

# models
from .models import (
    User
)

# serializers
from .serializers import (
    UserSerializer,

)

# swagger
from drf_spectacular.utils import (
    extend_schema,
)

class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    @extend_schema(exclude=True)
    def create(self, request, *args, **kwargs):
        return None
        
