from graphene import relay, UUID, JSONString
from graphene_django import DjangoObjectType

from .models import User, UserManager, Gender  # Status


class UsersType(DjangoObjectType):
    class Meta:
        model = User
        fields = (
            "id",
            "username",
            "first_name",
            "last_name",
            "profile_picture",
            "is_active",
        )
        interfaces = (relay.Node,)
    user_id = UUID(source="id")

    # @classmethod
    # def get_queryset(cls, queryset: UserManager, info):
    #     if info.context.user.is_staff:
    #         return queryset


class UserType(DjangoObjectType):
    current_location_coords = JSONString()

    class Meta:
        model = User
        fields = (
            "id",
            "email",
            "phone_number",
            "username",
            "first_name",
            "last_name",
            "profile_picture",
            "date_of_birth",
            "gender",
            "current_location_coords",
            "is_active",
            "status",
            "created_at",
        )
        interfaces = (relay.Node,)
    user_id = UUID(source="id")


class GenderType(DjangoObjectType):
    class Meta:
        model = Gender
        fields = ("id", "type")
        interfaces = (relay.Node,)
    gender_id = UUID(source="id")


# class StatusType(DjangoObjectType):
#     class Meta:
#         model = Status
#         fields = ("id", "type")
#         interfaces = (relay.Node,)
#     status_id = UUID(source="id")
