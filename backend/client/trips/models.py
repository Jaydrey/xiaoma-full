from datetime import datetime
from uuid import uuid4
from django.core.exceptions import ValidationError
from django.utils import timezone

from django.contrib.gis.db import models
from django.utils.translation import gettext_lazy as _

from users.models import User


class CancellationReason(models.Model):
    class Meta:
        default_related_name = _("cancellation_reasons")
        indexes = (
            models.Index(fields=("id",)),
        )
        ordering = ("-created_at",)
        verbose_name = _("cancellation_reason")
        verbose_name_plural = _("cancellation_reasons")

    id = models.UUIDField(default=uuid4, editable=False, primary_key=True)
    reason = models.TextField()
    created_at = models.DateTimeField(default=timezone.now, editable=False)


class TripStatus(models.Model):
    class Meta:
        default_related_name = _("trip_statuses")
        indexes = (
            models.Index(fields=("id",)),
        )
        ordering = ("-created_at",)
        verbose_name = _("trip_status")
        verbose_name_plural = _("trip_statuses")

    id = models.UUIDField(default=uuid4, editable=False, primary_key=True)
    type = models.CharField(max_length=10, unique=True)
    user = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, null=True)
    created_at = models.DateTimeField(default=timezone.now, editable=False)

    def __str__(self) -> str:
        return f"{self.type}"


class Trip(models.Model):
    class Meta:
        default_related_name = _("trips")
        indexes = (
            models.Index(fields=("id",)),
        )
        ordering = ("-created_at",)
        verbose_name = _("trip")
        verbose_name_plural = _("trips")

    id = models.UUIDField(default=uuid4, editable=False, primary_key=True)
    rider = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, related_name=_("trips_as_rider"))
    driver = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, related_name=_("trips_as_driver"))
    status = models.ForeignKey(TripStatus, on_delete=models.DO_NOTHING)
    cancellation_reason = models.ForeignKey(
        CancellationReason, on_delete=models.DO_NOTHING, null=True)
    pickup_location = models.PointField(geography=True)
    dropoff_location = models.PointField(geography=True)
    pickup_time = models.DateTimeField(null=True)
    dropoff_time = models.DateTimeField(null=True)
    order_time = models.DateTimeField(default=timezone.now)
    distance = models.FloatField()  # in kilometers
    fare = models.DecimalField(max_digits=5, decimal_places=1)
    created_at = models.DateTimeField(default=timezone.now, editable=False)
    updated_at = models.DateTimeField(editable=False, default=timezone.now)

    def __str__(self) -> str:
        return f"Trip {self.id}"

    def clean(self) -> None:
        '''
        when the status of the trip is canceled, the cancellation reason 
        has to be given. The field `cancellation_reason` shouldn't be null.
        '''
        if self.status.type == "canceled":
            if self.cancellation_reason is None:
                raise ValidationError(
                    "Cancellation reason is required for canceled trips")
        return super().clean()

    @property
    def pickup_location_coords(self) -> dict:
        return {"lat": self.pickup_location.x, "lng": self.pickup_location.y}

    @property
    def dropoff_location_coords(self) -> dict:
        return {"lat": self.dropoff_location.x, "lng": self.dropoff_location.y}

    @property
    def waiting_time(self):
        order_time: datetime = self.order_time
        now = timezone.now()
        waiting_time = now - order_time
        return waiting_time

    @property
    def waited_duration(self):
        """ In seconds
        """
        if self.pickup_time is None:
            return None

        pickup_time: datetime = self.pickup_time
        order_time: datetime = self.order_time
        waited_time = pickup_time - order_time
        return waited_time

    @property
    def current_ride_location(self) -> dict:
        """Determined by the location of the driver and rider"""
        driver_location = self.driver.current_location
        rider_location = self.rider.current_location
        return {
            "driver": {"lat": driver_location.x, "lng": driver_location.y},
            "rider": {"lat": rider_location.x, "lng": rider_location.y},
        }
