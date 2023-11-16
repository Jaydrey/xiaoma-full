from graphene import (
    relay,
    UUID,
    JSONString,
)
from graphene_django import DjangoObjectType



# models
from .models import (
    Trip,
    TripStatus,
    CancellationReason,
)


class TripsType(DjangoObjectType):
    class Meta:
        model = Trip
        # exclude_fields = (
        #     "rider",
        #     "driver",
        #     "pickup_time",
        #     "distance",
        #     "pickup_location",
        #     "dropoff_location",
        #     "cancellation_reason",
        #     "created_at",
        #     "updated_at",
        # )
        fields = "__all__"
        interfaces = (relay.Node, )
    pickup_location_coords = JSONString()
    dropoff_location_coords = JSONString()

    def resolve_pickup_location_coords(self, info):
        return self.pickup_location_coords

    def resolve_dropoff_location_coords(self, info):
        return self.dropoff_location_coords


class TripType(DjangoObjectType):
    class Meta:
        model = Trip
        exclude_fields = (
            "pickup_location",
            "dropoff_location",
            "updated_at",
        )
        interfaces = (relay.Node,)
    pickup_location_coords = JSONString()
    dropoff_location_coords = JSONString()
    trip_id = UUID(source="id")

    def resolve_pickup_location_coords(self, info):
        return self.pickup_location_coords

    def resolve_dropoff_location_coords(self, info):
        return self.dropoff_location_coords


class TripStatusType(DjangoObjectType):
    class Meta:
        model = TripStatus
        fields = ("id", "type")
        interfaces = (relay.Node,)
    trip_status_id = UUID(source="id")


class CancellationReasonType(DjangoObjectType):
    class Meta:
        model = CancellationReason
        fields = ("id", "reason", "created_at")
        interfaces = (relay.Node,)
    cancellation_reason_id = UUID(source="id")
