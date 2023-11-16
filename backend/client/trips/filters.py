import django_filters
from django_filters import FilterSet

# models
from .models import (
    Trip,
    TripStatus,
    CancellationReason
)


class TripsFilter(FilterSet):
    fare_gt = django_filters.NumberFilter(field_name="fare", lookup_expr="gt")
    fare_lt = django_filters.NumberFilter(field_name="fare", lookup_expr="lt")

    class Meta:
        model = Trip
        fields = (
            "rider",
            "driver",
            "status",
            "fare"
        )


class TripFilter(FilterSet):
    id = django_filters.CharFilter(lookup_expr="exact")

    class Meta:
        model = Trip
        fields = ("id",)


class TripStatusFilter(FilterSet):
    id = django_filters.CharFilter(lookup_expr="exact")
    type = django_filters.CharFilter(lookup_expr="exact")

    class Meta:
        model = TripStatus
        fields = ("id", "type")


class CancellationReasonFilter(FilterSet):
    id = django_filters.CharFilter(lookup_expr="exact")
    reason = django_filters.CharFilter(lookup_expr="icontains")
    # cancel_time = django_filters.DateRangeFilter()
    class Meta:
        model = CancellationReason
        fields = ("id", "reason")

