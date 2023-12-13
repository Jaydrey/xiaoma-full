import graphene
from graphene_django.filter import DjangoFilterConnectionField
# mutations
from .mutations import (
    CreateSavedLocationMutation,
)

# types
from .types import (
    LocationType,
)

# filters
from .filters import (
    LocationFilter,
)


class Mutation(graphene.ObjectType):
    create_saved_location = CreateSavedLocationMutation.Field()


class Query(graphene.ObjectType):
    locations = DjangoFilterConnectionField(
        LocationType, filterset_class=LocationFilter)
    location_mode = graphene.List(LocationType)
