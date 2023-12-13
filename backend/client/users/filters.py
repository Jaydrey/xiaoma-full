import django_filters
from django_filters import FilterSet

from .models import User, Gender


class RidersFilter(FilterSet):
    first_name = django_filters.CharFilter(lookup_expr="icontains")
    last_name = django_filters.CharFilter(lookup_expr="icontains")
    is_active = django_filters.BooleanFilter()

    class Meta:
        model = User
        fields = (
            "first_name",
            "last_name",
            "is_active",
        )


class RiderFilter(FilterSet):
    id = django_filters.CharFilter(lookup_expr="exact")
    username = django_filters.CharFilter(lookup_expr="contains")

    class Meta:
        model = User
        fields = ("id", "username")


class GenderFilter(FilterSet):
    id = django_filters.CharFilter(lookup_expr="exact")
    type = django_filters.CharFilter(lookup_expr="icontains")

    class Meta:
        model = Gender
        fields = ("id", "type")


# class StatusFilter(FilterSet):
#     id = django_filters.CharFilter(lookup_expr="exact")
#     type = django_filters.CharFilter(lookup_expr="icontains")

#     class Meta:
#         model = Status
#         fields = ("id", "type")
