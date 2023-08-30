import graphene
from graphene_django.filter import DjangoFilterConnectionField


# types
from .types import (
    TripsType,
    TripType,
    TripStatusType,
    CancellationReasonType,
)

# mutations
from .mutations import (
    CreateTripMutation,
    CreateTripStatusMutation,
    CreateCancellationReasonMutation,
    UpdateTripMutation,
)

# filters
from .filters import (
    TripsFilter,
    TripFilter,
    TripStatusFilter,
    CancellationReasonFilter
)


class Mutation(graphene.ObjectType):
    create_trip = CreateTripMutation.Field()
    create_trip_status = CreateTripStatusMutation.Field()
    create_cancellation_reason = CreateCancellationReasonMutation.Field()
    update_trip = UpdateTripMutation.Field()


class Query(graphene.ObjectType):
    trips = DjangoFilterConnectionField(TripsType, filterset_class=TripsFilter)
    trip = DjangoFilterConnectionField(TripType, filterset_class=TripFilter)
    trip_status = DjangoFilterConnectionField(
        TripStatusType, filterset_class=TripStatusFilter)
    cancellation_reasons = DjangoFilterConnectionField(
        CancellationReasonType, filterset_class=CancellationReasonFilter)
    
