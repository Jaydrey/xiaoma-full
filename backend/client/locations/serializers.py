from django.utils import timezone
from django.contrib.gis.geos import Point
from rest_framework import serializers

# maps


# models
from .models import (
    Location,
    LocationMode,
)
from accounts.models import (
    Account,
)


class LocationsSerializer(serializers.ModelSerializer):
    account = serializers.PrimaryKeyRelatedField(
        queryset=Account.objects.all(),
        required=True,
        allow_null=False,
    )
    mode = serializers.PrimaryKeyRelatedField(
        queryset=LocationMode.objects.all(),
        required=True,
        allow_null=False,
    )

    class Meta:
        model = Location
        fields = (
            "id",
            "name",
            "account",
            "mode",
            "location_coords",
        )


class CreateSavedLocationSerializer(serializers.ModelSerializer):
    account = serializers.PrimaryKeyRelatedField(
        queryset=Account.objects.all(),
        required=True,
        allow_null=False
    )
    mode = serializers.PrimaryKeyRelatedField(
        queryset=LocationMode.objects.all(),
        required=True,
        allow_null=False,
    )
    location = serializers.JSONField()

    class Meta:
        model = Location
        fields = (
            "id",
            "name",
            "account",
            "mode",
            "location",
            "location_coords",
        )
        write_only_fields = ("location",)
        read_only_fields = ("id", "location_coords")

    def validate(self, attrs: dict):
        mode = attrs.get("mode")
        print(mode)
        return super().validate(attrs)

    def create(self, validated_data: dict):
        location_data: dict = validated_data.pop("location", None)
        if location_data:
            latitude = location_data.get("lat")
            longitude = location_data.get("lng")
            location = Point(x=latitude, y=longitude)
            validated_data["location"] = location
            saved_location = Location.objects.create(**validated_data)
            return saved_location


class CreateDriverSavedLocationSerializer(serializers.ModelSerializer):
    account = serializers.PrimaryKeyRelatedField(
        queryset=Account.objects.all(),
        required=True,
        allow_null=False
    )
    location = serializers.JSONField()

    class Meta:
        model = Location
        fields = (
            "id",
            "account",
            "location",
            "location_coords",
        )
        write_only_fields = ("location",)
        read_only_fields = ("id", "location_coords")

    def create(self, validated_data: dict):
        location_data: dict = validated_data.pop("location", None)
        if location_data:
            latitude = location_data.get("lat")
            longitude = location_data.get("lng")
            location = Point(x=latitude, y=longitude)
            validated_data["location"] = location
            saved_location = Location.objects.create(**validated_data)
            return saved_location


class SaveSearchedLocations(serializers.ModelSerializer):
    class Meta:
        model = Location
