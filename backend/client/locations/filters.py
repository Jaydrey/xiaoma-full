import django_filters
from django_filters import FilterSet

# models
from .models import (
    Location,
    LocationMode
)


class LocationFilter(FilterSet):
    name = django_filters.CharFilter(lookup_expr="icontains")
    account = django_filters.CharFilter(
        field_name="account__user__username", lookup_expr="iexact")
    mode = django_filters.CharFilter(
        field_name="locationmode__mode", lookup_expr="exact")

    class Meta:
        model = Location
        fields = (
            "name",
            "account",
            "mode",
        )
