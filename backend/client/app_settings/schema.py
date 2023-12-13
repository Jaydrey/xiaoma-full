import graphene
from graphene_django.filter import DjangoFilterConnectionField

# types
from .types import (
    AppSettingsType,
    AppSettingType,
    LanguagesType,
    LanguageType,
    RideContactsType,
    RideContactType,
)

# filters
from .filters import (
    AppSettingsFilter,
    LanguagesFilter,
    RideContactsFilter,
)

# mutations
from .mutations import(
    CreateAppSettingsMutation,
    CreateLanguageMutation,
    CreateRideContactMutation
)


class Mutation(graphene.ObjectType):
    create_app_setting = CreateAppSettingsMutation.Field()
    create_language = CreateLanguageMutation.Field()
    create_ride_contact = CreateRideContactMutation.Field()


class Query(graphene.ObjectType):
    app_settings = DjangoFilterConnectionField(AppSettingsType, filterset_class=AppSettingsFilter)
    app_setting = DjangoFilterConnectionField(AppSettingType, filterset_class=AppSettingsFilter)
    languages = DjangoFilterConnectionField(LanguagesType, filterset_class=LanguagesFilter)
    language = DjangoFilterConnectionField(LanguageType, filterset_class=LanguagesFilter)
    ride_contacts = DjangoFilterConnectionField(RideContactsType, filterset_class=RideContactsFilter)
    ride_contact = DjangoFilterConnectionField(RideContactType, filterset_class=RideContactsFilter)
    
