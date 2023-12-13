import graphene
from graphene_django import DjangoObjectType

# models
from .models import (
    AppSetting,
    Language,
    RideContact,
)

class AppSettingsType(DjangoObjectType):
    class Meta:
        model = AppSetting
        fields = ("id", "language", "account")
        interfaces = (graphene.relay.Node,)

    setting_id = graphene.UUID(source="id")

class AppSettingType(DjangoObjectType):
    class Meta:
        model = AppSetting
        fields = ("id", "language", "account")
        interfaces = (graphene.relay.Node,)

    setting_id = graphene.UUID(source="id")


class LanguagesType(DjangoObjectType):
    class Meta:
        model = Language
        fields = ("id", "name", "code")
        interfaces = (graphene.relay.Node,)

    language_id = graphene.UUID(source="id")

class LanguageType(DjangoObjectType):
    class Meta:
        model = Language
        fields = ("id", "name", "code")
        interfaces = (graphene.relay.Node,)

    language_id = graphene.UUID(source="id")


class RideContactsType(DjangoObjectType):
    class Meta:
        model = RideContact
        fields = (
            "id",
            "contact_name",
            "phone_number",
        )
        interfaces = (graphene.relay.Node,)

    ride_contact_id = graphene.UUID(source="id")


class RideContactType(DjangoObjectType):
    class Meta:
        model = RideContact
        fields = (
            "id",
            "contact_name",
            "phone_number",
            "xiaoma_account",
            "rider_account"
        )
        interfaces = (graphene.relay.Node,)

    ride_contact_id = graphene.UUID(source="id")

