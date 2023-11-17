from uuid import uuid4
from django.db import models
from django.utils import timezone

from django.utils.translation import gettext_lazy as _

# models
from accounts.models import Account


class Language(models.Model):
    class Meta:
        default_related_name = _("language")
        indexes = (
            models.Index(fields=("id","name")),
        )
        verbose_name = _("language")
        verbose_name_plural = _("languages")

    id = models.UUIDField(default=uuid4, editable=False, primary_key=True)
    name = models.CharField(_("language name"), max_length=50)
    code = models.CharField(_("language code"), max_length=5, null=True)


class Contact(models.Model):
    '''
    Contacts of the riders that a ride can be shared with
    '''
    class Meta:
        default_related_name = _("contacts")
        indexes = (
            models.Index(fields=("id","contact_name")),
        )
        ordering = ("-created_at",)
        verbose_name = _("contact")
        verbose_name_plural = _("contacts")

    id = models.UUIDField(default=uuid4, editable=False, primary_key=True)
    contact_name = models.CharField(_("contact name"), max_length=50,)
    phone_number = models.CharField(_("phone number"), max_length=14)
    account = models.ForeignKey(Account, verbose_name=_("xiaoma account"), on_delete=models.DO_NOTHING, null=True, related_name="xiaoma_account")
    rider_account = models.ForeignKey(Account, verbose_name=_("rider account"), on_delete=models.DO_NOTHING)
    created_at = models.DateTimeField(_("created at"), default=timezone.now, editable=False)

    


class AppSetting(models.Model):
    class Meta:
        default_related_name = _("app_settings")
        ordering = ("-created_at",)
        verbose_name = _("app_setting")
        verbose_name_plural = _("app_settings")

    id = models.UUIDField(default=uuid4, editable=False, primary_key=True)
    language = models.ForeignKey(Language, verbose_name=_("language"), on_delete=models.DO_NOTHING)
    account = models.ForeignKey(Account, on_delete=models.DO_NOTHING, related_name="app_account")
    created_at = models.DateTimeField(_("created at"), default=timezone.now, editable=False)

