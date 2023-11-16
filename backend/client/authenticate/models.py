from uuid import uuid4
from django.db import models
from django.utils import timezone

from django.utils.translation import gettext_lazy as _


class PinCode(models.Model):
    class Meta:
        default_related_name = _("pin_codes")
        indexes = (
            models.Index(fields=("id", "pin")),
        )
        ordering = ("-created_at",)
        verbose_name = _("pin_code")
        verbose_name_plural = _("pin_codes")

    id = models.UUIDField(_("pin id"), default=uuid4,
                          editable=False, primary_key=True)
    pin = models.IntegerField(_("pin"),unique=True)
    created_at = models.DateTimeField(
        _("date created"), default=timezone.now, editable=False)

