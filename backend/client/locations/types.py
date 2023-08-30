from graphene import relay, UUID
from graphene_django import DjangoObjectType

# models
from .models import (
    Location,
    LocationMode,
)


class LocationType(DjangoObjectType):
    class Meta:
        model = Location
        fields = (
            "id",
            "name",
            "account",
            "mode",
            "location_coords",
        )
        interfaces = (relay.Node,)
    location_id = UUID(source="id")
