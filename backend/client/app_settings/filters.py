import django_filters

# models
from .models import (
    AppSetting,
    Language,
    RideContact,
)


class AppSettingsFilter(django_filters.FilterSet):
    class Meta:
        model = AppSetting
        fields = (
            "language",
            "account",
        )

class LanguagesFilter(django_filters.FilterSet):
    name = django_filters.CharFilter(lookup_expr="icontains")
    class Meta:
        model = Language
        fields = ("name",)

class RideContactsFilter(django_filters.FilterSet):
    contact_name = django_filters.CharFilter(lookup_expr="icontains")
    phone_number = django_filters.CharFilter(lookup_expr="icontains")
    class Meta:
        model = RideContact
        fields = (
            "contact_name", 
            "phone_number", 
            "xiaoma_account",
        )
        