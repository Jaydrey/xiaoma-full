from uuid import uuid4
from django.contrib.gis.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

# models
from users.models import User


class Status(models.Model):
    class Meta:
        default_related_name = "statuses"
        indexes = (
            models.Index(fields=("id", "type")),
        )
        ordering = ("type",)
        verbose_name = "status"
        verbose_name_plural = "statuses"

    id = models.UUIDField(_("status id"), default=uuid4,
                          editable=False, primary_key=True)
    type = models.CharField(_("status type"), max_length=10, unique=True)
    created_at = models.DateTimeField(
        _("date created"), default=timezone.now, editable=False)

    def __str__(self) -> str:
        return f"{self.type}"


class Account(models.Model):
    class Meta:
        default_related_name = _("rider_accounts")
        indexes = (
            models.Index(fields=("id",)),
        )
        ordering = ("-created_at",)
        verbose_name = "account"
        verbose_name_plural = _("rider_accounts")

    id = models.UUIDField(_("status id"), default=uuid4,
                          editable=False, primary_key=True)
    home_address = models.PointField(geography=True, null=True)
    work_address = models.PointField(geography=True, null=True)
    # credit_card =
    # settings
    user = models.OneToOneField(
        User, on_delete=models.DO_NOTHING, verbose_name=_("user account"))
    status = models.ForeignKey(
        Status, on_delete=models.DO_NOTHING, null=True, verbose_name=_("account status"))
    created_at = models.DateTimeField(
        _("date created"), default=timezone.now, editable=False)
    updated_at = models.DateTimeField(
        _("edited date"), editable=False, default=timezone.now)

