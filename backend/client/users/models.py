import re
from uuid import uuid4
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
from django.contrib.gis.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _


class UserManager(BaseUserManager):
    def create_user(self, **extra_fields):
        if extra_fields.get("username") is None:
            if extra_fields.get("email") is None and extra_fields.get("phone_number") is None:
                raise ValueError(
                    {"error": "Email or phone number field is required"})
            extra_fields["username"] = extra_fields.get("email") if extra_fields.get(
                "email") is not None else extra_fields.get("phone_number")

        try:
            user: User = self.model(**extra_fields)
            if "password" in extra_fields:
                user.set_password(extra_fields.get("password"))
            user.save(using=self._db)
            return user
        except Exception as e:
            print(f"Error while creating user {e}")
            raise ValueError(e)

    def create_superuser(self, email: str = None, password: str = None, phone_number: str = None, username: str = None, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)
        print(f"{username=}")
        return self.create_user(email=email, password=password, phone_number=phone_number, username=username, **extra_fields)
# class choices


class Gender(models.Model):
    class Meta:
        default_related_name = "genders"
        indexes = (
            models.Index(fields=("id", "type")),
        )
        ordering = ("type",)
        verbose_name = "gender"
        verbose_name_plural = "genders"

    id = models.UUIDField(_("gender id"), default=uuid4,
                          editable=False, primary_key=True)
    type = models.CharField(_("gender type"), max_length=10, unique=True)
    created_at = models.DateTimeField(
        _("date created"), default=timezone.now, editable=False)

    def __str__(self) -> str:
        return f"{self.type}"


class User(AbstractBaseUser, PermissionsMixin):
    class Meta:
        default_related_name = _("users")
        indexes = (
            models.Index(fields=("id", "username")),
        )
        ordering = ("-created_at",)
        verbose_name = _("user")
        verbose_name_plural = _("users")

    id = models.UUIDField(_("user id"), default=uuid4,
                          editable=False, primary_key=True)
    email = models.EmailField(_("email"), null=True)
    phone_number = models.CharField(
        _("phone number"), max_length=10, null=True)
    username = models.CharField(_("username"), max_length=50, unique=True)
    first_name = models.CharField(_("first name"), max_length=50, null=True)
    last_name = models.CharField(_("last name"), max_length=50, null=True)
    profile_picture = models.URLField(_("profile picture"), null=True)
    date_of_birth = models.DateField(_("date of birth"), null=True)
    gender = models.ForeignKey(
        Gender, on_delete=models.DO_NOTHING, null=True, verbose_name=_("user's gender"))
    current_location = models.PointField(
        _("current location"), geography=True, null=True)
    is_active = models.BooleanField(_("is active"), default=True)
    is_superuser = models.BooleanField(_("is super user"), default=False)
    is_staff = models.BooleanField(_("is staff"), default=False)
    is_deleted = models.BooleanField(_("is deleted"), default=False)
    created_at = models.DateTimeField(
        _("date created"), default=timezone.now, editable=False)
    updated_at = models.DateTimeField(
        _("edited date"), editable=False, default=timezone.now)

    USERNAME_FIELD = "username"
    EMAIL_FIELD = "username"

    objects = UserManager()

    def __str__(self) -> str:
        return f"{self.username}"

    @property
    def current_location_coords(self) -> dict:
        return {"lat": self.current_location.x, "lng": self.current_location.y, }

    def username_type(self) -> str:
        """Is the username an email or a phone_number"""
        phone_pattern = r'^\d{10}$'
        email_pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

        if re.match(phone_pattern, self.username):
            return "phone number"
        elif re.match(email_pattern, self.username):
            return "email"
        else:
            return "unknown"
