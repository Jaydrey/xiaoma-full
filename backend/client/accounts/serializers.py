from rest_framework import serializers

from .models import (
    Account,
    Status,
)
class StatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Status
        fields = "__all__"
        read_only_fields = ("id", "created_at")

class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = "__all__"
        read_only_fields = ("id", "created_at", "updated_at")

class RenewPasswordSerializer(serializers.Serializer):
    password = serializers.CharField(required=True, allow_null=False)

    