from graphene_django.rest_framework.mutation import SerializerMutation
from .serializers import (
    CreateUserSerializer,
    CreateGenderSerializer,
    UpdateUserProfilePictureSerializer,
    UpdateUserNameSerializer,
    UpdateUserPhoneNumberSerializer,
    UpdateUserEmailSerializer,
    UpdateUserCurrentLocationSerializer,
)


class CreateUserMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateUserSerializer
        model_operations = ("create",)


class CreateGenderMutation(SerializerMutation):
    class Meta:
        serializer_class = CreateGenderSerializer
        model_operations = ("create",)


class UpdateUserNameMutation(SerializerMutation):
    class Meta:
        serializer_class = UpdateUserNameSerializer
        model_operations = ("update",)


class UpdateUserProfilePictureMutation(SerializerMutation):
    class Meta:
        serializer_class = UpdateUserProfilePictureSerializer
        model_operations = ("update",)


class UpdateUserPhoneNumberMutation(SerializerMutation):
    class Meta:
        serializer_class = UpdateUserPhoneNumberSerializer
        model_operations = ("update",)


class UpdateUserEmailMutation(SerializerMutation):
    class Meta:
        serializer_class = UpdateUserEmailSerializer
        model_operations = ("update",)


class UpdateUserCurrentLocationMutation(SerializerMutation):
    class Meta:
        serializer_class = UpdateUserCurrentLocationSerializer
        model_operations = ("update",)
        
# class CreateStatusMutation(SerializerMutation):
#     class Meta:
#         serializer_class = CreateStatusSerializer
#         model_operation = ("create",)
