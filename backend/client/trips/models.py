from datetime import datetime
from uuid import uuid4
from django.core.exceptions import ValidationError
from django.utils import timezone

from django.db import models
from django.utils.translation import gettext_lazy as _

from accounts.models import Account


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



class Trip(models.Model):
    STATUS_CHOICES = (
        ("booked", "Booked"),
        ("cancelled", "Cancelled"),
        ("en-route", "En-Route"),
        ("completed", "Completed"),
    )
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
        Account, on_delete=models.DO_NOTHING, related_name=_("trips_as_rider"))
    driver = models.ForeignKey(
        Account, on_delete=models.DO_NOTHING, related_name=_("trips_as_driver"))
    status = models.CharField(_("status"), max_length=15, choices=STATUS_CHOICES, default="booked")
    cancellation_reason = models.ForeignKey(
        CancellationReason, on_delete=models.DO_NOTHING, null=True)
    pickup_location = models.CharField(_("pick up location"), max_length=50)
    dropoff_location = models.CharField(_("drop off location"), max_length=50)
    pickup_time = models.DateTimeField(null=True)
    dropoff_time = models.DateTimeField(null=True)
    order_time = models.DateTimeField(default=timezone.now)
    distance = models.DecimalField(max_digits=10, decimal_places=2, null=True)  # in kilometers
    fare = models.DecimalField(max_digits=10, decimal_places=2, null=True)
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
        lat,lng = self.pickup_location.split(",")
        return {"lat": lat, "lng": lng}

    @property
    def dropoff_location_coords(self) -> dict:
        lat,lng = self.dropoff_location.split(",")
        return {"lat": lat, "lng": lng}

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
        driver_location = self.driver.current_location_coords
        rider_location = self.rider.current_location_coords
        return {
            "driver": driver_location,
            "rider": rider_location,
        }
