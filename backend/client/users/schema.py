import graphene
from graphene_django.filter import DjangoFilterConnectionField

# types
from .types import (
    UsersType,
    UserType,
    GenderType,
    # StatusType,
)

# mutations
from .mutations import (
    CreateUserMutation,
    CreateGenderMutation,
    UpdateUserNameMutation,
    UpdateUserProfilePictureMutation,
    UpdateUserPhoneNumberMutation,
    UpdateUserEmailMutation,
    UpdateUserCurrentLocationMutation,
    # CreateStatusMutation,
)

# filters
from .filters import (
    RidersFilter,
    RiderFilter,
    GenderFilter,
    # StatusFilter,
)




class Mutation(graphene.ObjectType):
    create_user = CreateUserMutation.Field()
    create_gender = CreateGenderMutation.Field()
    update_user_name = UpdateUserNameMutation.Field()
    update_user_profile_pic = UpdateUserProfilePictureMutation.Field()
    update_user_phone_number = UpdateUserPhoneNumberMutation.Field()
    update_user_email = UpdateUserEmailMutation.Field()
    update_user_current_location = UpdateUserCurrentLocationMutation.Field()


class Query(graphene.ObjectType):
    genders = DjangoFilterConnectionField(
        GenderType, filterset_class=GenderFilter)
    users = DjangoFilterConnectionField(
        UsersType, filterset_class=RidersFilter)
    user = DjangoFilterConnectionField(UserType, filterset_class=RiderFilter)
