import time
from rest_framework import status
from rest_framework.request import Request
from rest_framework.response import Response

from rest_framework.views import APIView

from rest_framework.permissions import AllowAny


from rest_framework_simplejwt.tokens import RefreshToken

# views
from rest_framework_simplejwt.views import TokenObtainPairView

# models
from .models import PinCode
from accounts.models import Account
from users.models import User
# serializers
from .serializers import (
    CreateUserSerializer,
    UserLoginSerializer,
    LoginResponseSerializer,
    ActivateAccountSerializer,
    ErrorSerializer,
    EmailValidSerializer,
    PhoneNumberValidSerializer
)
from users.serializers import (
    UserSerializer
)
# swagger
from drf_spectacular.utils import (
    extend_schema,
)


# Register Endpoint
class RegistrationAPIView(APIView):
    permission_classes = (AllowAny,)
    authentication_classes = ()

    @extend_schema(
        request=CreateUserSerializer,
        responses=UserSerializer,

    )
    def post(self, request: Request, *args, **kwargs):
        data = request.data
        serializer = CreateUserSerializer(data=data)

        serializer.is_valid(raise_exception=True)

        user: User = serializer.save()

        serializer_user = UserSerializer(user)
        return Response(serializer_user.data, status=status.HTTP_201_CREATED)


# Login Endpoint
class LoginAPIView(TokenObtainPairView):
    permission_classes = (AllowAny,)
    serializer_class = UserLoginSerializer

    @extend_schema(
        request=UserLoginSerializer,
        responses=LoginResponseSerializer,
    )
    def post(self, request: Request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        # return Response({"errors": serializer.error_messages}, status=status.HTTP_401_UNAUTHORIZED)

        print(serializer.validated_data)
        user = serializer.validated_data.get("user")
        if isinstance(user, User):
            print(f'{user=}')
            refresh = RefreshToken.for_user(user)

            refresh["email"] = str(user.email)

            return Response({
                'access': str(refresh.access_token),
                'refresh': str(refresh),
            }, status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)


class ValidateEmailAPIView(APIView):
    permission_classes = (AllowAny,)
    serializer_class = EmailValidSerializer

    @extend_schema(
        request=EmailValidSerializer,
        responses=EmailValidSerializer,
    )
    def post(self, request: Request, *args, **kwargs):
        data = request.data
        serializer = EmailValidSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        return Response(status=status.HTTP_200_OK)


class ValidatePhoneNumberAPIView(APIView):
    permission_classes = (AllowAny,)
    serializer_class = PhoneNumberValidSerializer

    @extend_schema(
        request=PhoneNumberValidSerializer,
        responses=PhoneNumberValidSerializer,
    )
    def post(self, request: Request, *args, **kwargs):
        data = request.data
        serializer = PhoneNumberValidSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        return Response(status=status.HTTP_200_OK)


class ActivateAccountAPIView(APIView):
    permission_classes = (AllowAny,)

    def get_object(self, user_id: str):
        try:
            return User.objects.get(id=user_id)
        except Exception as e:
            print(e)
            return None

    @extend_schema(
        request=ActivateAccountSerializer,
        responses={200: UserSerializer, 400: ErrorSerializer},
    )
    def put(self, request: Request, user_id: str, *args, **kwargs):
        user = self.get_object(user_id)

        if user is None:
            serializer = ErrorSerializer(
                data={"message": f"user id {user_id} doesn't exist"})
            serializer.is_valid()
            return Response(serializer.data, status=status.HTTP_404_NOT_FOUND)

        data = request.data
        serializer = ActivateAccountSerializer(data=data)
        serializer.is_valid(raise_exception=True)

        user.is_active = True
        user.save()
        serializer = UserSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)

