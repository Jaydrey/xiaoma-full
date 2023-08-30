import graphene

from graphene_django.filter import DjangoFilterConnectionField

# schemas
from trips.schema import (
    Mutation as TripAppMutation,
    Query as TripAppQuery,
)
from users.schema import (
    Mutation as UserAppMutation,
    Query as UserAppQuery
)

from locations.schema import (
    Mutation as LocationMutation,
    Query as LocationQuery,
)


class Mutation(
    LocationMutation,
    UserAppMutation,
    TripAppMutation,
):
    pass


class Query(
    LocationQuery,
    TripAppQuery,
    UserAppQuery,
):
    pass


schema = graphene.Schema(query=Query, mutation=Mutation)
