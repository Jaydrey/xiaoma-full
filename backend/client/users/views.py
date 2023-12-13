from rest_framework import status
from rest_framework.request import Request
from rest_framework.response import Response

from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView

from rest_framework.permissions import AllowAny
from rest_framework.decorators import action


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
    UpdateUserNameSerializer,
)

# swagger
from drf_spectacular.utils import (
    extend_schema,
)

class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (AllowAny,)
        

    @extend_schema(exclude=True)
    def create(self, request, *args, **kwargs):
        return None
        

class UpdateFullNameAPIView(APIView):
    permission_classes = (AllowAny,)

    @extend_schema(
        request=UpdateUserNameSerializer,
        responses=str,
    )
    def put(self, request: Request, id: str=None, *args, **kwargs):
        if id is None:
            return Response("user id is missing", status=status.HTTP_400_BAD_REQUEST)
        
        try:
            user = User.objects.get(id=id)
        except Exception as e:
            return Response("user doesn't exist", status=status.HTTP_404_NOT_FOUND)
        data = request.data
        serializer = UpdateUserNameSerializer(user, data=data)
        serializer.is_valid(raise_exception=True)

        serializer.save()
        return Response("updated full name successfully", status=status.HTTP_200_OK)