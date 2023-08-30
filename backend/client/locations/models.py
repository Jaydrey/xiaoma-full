from uuid import uuid4
from django.contrib.gis.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

# models
from accounts.models import Account


class LocationMode(models.Model):
    class Meta:
        default_related_name = "location_modes"
        indexes = (
            models.Index(fields=("id",)),
        )
        ordering = ("-created_at",)
        verbose_name = "location_mode"
        verbose_name_plural = "location_modes"

    id = models.UUIDField(_("status id"), default=uuid4,
                          editable=False, primary_key=True)
    mode = models.CharField(_("location mode"), max_length=50)
    created_at = models.DateTimeField(
        _("date created"), default=timezone.now, editable=False)


class Location(models.Model):
    class Meta:
        default_related_name = "locations"
        indexes = (
            models.Index(fields=("id", "account")),
        )
        ordering = ("-created_at",)
        verbose_name = "location"
        verbose_name_plural = "locations"

    id = models.UUIDField(_("status id"), default=uuid4,
                          editable=False, primary_key=True)
    name = models.CharField(_("location name"), max_length=500,)
    account = models.ForeignKey(
        Account, on_delete=models.DO_NOTHING, verbose_name=_("account"))
    mode = models.ForeignKey(
        LocationMode, on_delete=models.DO_NOTHING, verbose_name=_("location mode"))
    location = models.PointField(_("location"), geography=True)
    created_at = models.DateTimeField(
        _("date created"), default=timezone.now, editable=False)

    def __str__(self) -> str:
        return self.id

    @property
    def location_coords(self) -> dict:
        return {"lat": self.location.x, "lng": self.location.y, }
