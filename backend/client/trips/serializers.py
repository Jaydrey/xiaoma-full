from rest_framework import serializers

# models
from .models import Trip, TripStatus, CancellationReason
from users.models import User


class CreateTripSerializer(serializers.ModelSerializer):
    rider = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all(),
        required=True,
        allow_null=False,
    )
    driver = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all(),
        required=True,
        allow_null=False,
    )
    status = serializers.PrimaryKeyRelatedField(
        queryset=TripStatus.objects.all(),
        required=True,
        allow_null=False,
    )
    cancellation_reason = serializers.PrimaryKeyRelatedField(
        queryset=CancellationReason.objects.all(),
        required=False,
        allow_null=True,
    )

    class Meta:
        model = Trip
        fields = (
            "id",
            "rider",
            "driver",
            "status",
            "cancellation_reason",
            "pickup_location",
            "dropoff_location",
            "pickup_time",
            "dropoff_time",
            "distance",
            "fare",
            "created_at",
        )
        read_only_fields = ("id", "created_at",)


class TripSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trip
        fields = "__all__"
        read_only_fields = (
            "id", 
            "pickup_time", 
            "dropoff_time", 
            "order_time", 
            "distance",
            "fare",
            "created_at",
            "updated_at",
            "status"
        )

class CancellationReasonSerializer(serializers.ModelSerializer):
    class Meta:
        model = CancellationReason
        fields = "__all__"

class CreateTripStatusSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all(),
        required=True,
        allow_null=False,
    )

    class Meta:
        model = TripStatus
        fields = (
            "id",
            "type",
        )
        read_only_fields = ("id",)

class TripStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = TripStatus
        fields = "__all__"

class CreateCancellationReasonSerializer(serializers.ModelSerializer):
    class Meta:
        model = CancellationReason
        fields = (
            "id",
            "reason",
        )
        read_only_fields = ("id",)


class UpdateTripSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trip
        fields = (
            "id",
            "status",
            "pickup_time",
            "distance",
            "fare",
            "dropoff_time",
        )


class UpdateTripStatus(serializers.ModelSerializer):
    class Meta:
        model = TripStatus
        fields = ("id", "type")


class CancelTripSerializer(serializers.ModelSerializer):
    cancellation_reason = serializers.PrimaryKeyRelatedField(
        queryset=CancellationReason.objects.all(),
        required=False,
        allow_null=True,
    )

    class Meta:
        model = Trip
        fields = ("id", "cancellation_reason",)
