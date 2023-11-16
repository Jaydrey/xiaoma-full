from rest_framework import serializers

# models
from .models import (
    Language,
    RideContact,
    AppSetting,
)


class LanguagesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = "__all__"


class RideContactsSerializer(serializers.ModelSerializer):
    class Meta:
        model = RideContact
        fields = (
            "id",
            "contact_name",
            "phone_number",
        )


class RideContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = RideContact
        fields = "__all__"


class AppSettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = AppSetting
        fields = (
            "id",
            "language",
            "account",
        )


class CreateLanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = ("id", "name", "code")
        read_only_fields = ("id",)


class CreateRideContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = RideContact
        fields = (
            "id", 
            "contact_name", 
            "phone_number", 
            "xiaoma_account",
        )
        read_only_fields = ("id", "xiaoma_account")


class CreateAppSettingSerializer(serializers.ModelSerializer):
    account = serializers.PrimaryKeyRelatedField(
        queryset=AppSetting.objects.all(),
        required=True,
        allow_null=False,
    )
     
    class Meta:
        model  = AppSetting
        fields = (
            "id",
            "language",
            "account",
        )
