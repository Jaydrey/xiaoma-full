from django.utils import timezone
from django.contrib.gis.geos import Point
from django.contrib.auth import authenticate
from rest_framework import serializers


from users.models import User  # Status
from .models import PinCode


class LoginResponseSerializer(serializers.Serializer):
    access = serializers.CharField()
    refresh = serializers.CharField()


class CreateUserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = "__all__"
        write_only_fields = (
            "password",
        )
        read_only_fields = (
            "id",
            "last_login",
            "is_active",
            "is_superuser",
            "is_staff",
            "is_deleted",
            "created_at",
            "updated_at",
            "groups",
            "user_permissions"
        )

    def create(self, validated_data: dict):
        current_location_data: str = validated_data.pop(
            "current_location", None)
        if current_location_data:
            latitude, longitude = current_location_data.split(",")
            current_location = f"{latitude},{longitude}"
            validated_data["current_location"] = current_location
        user: User | None = User.objects.create_user(**validated_data)
        return user


class UserLoginSerializer(serializers.Serializer):
    email = serializers.EmailField(required=False, allow_null=True)
    password = serializers.CharField(write_only=True)
    phone_number = serializers.CharField(required=False, allow_null=True)
    # otp = serializers.CharField(required=False, allow_null=True)

    def validate(self, data: dict):
        email = data.get('email')
        password = data.get('password')
        phone_number = data.get("phone_number")

        if not password:
            return serializers.ValidationError("provide password for login")

        if phone_number is None and email is None:
            return serializers.ValidationError(
                "provide either phone number or email for login")
        print(f'{data=}')
        print(f'{self.context.get("request")=}')
        if email:
            user = authenticate(request=self.context.get(
                'request'), email=email, password=password)
            if not user:
                return serializers.ValidationError("Invalid email or password.")

            return {
                'user': user
            }
        if phone_number:
            user = User.objects.get(phone_number=phone_number)

            if not user:
                return serializers.ValidationError("Invalid otp.")
            return {
                'user': user
            }

        print(user)
        return data

class ActivateAccountSerializer(serializers.Serializer):
    pin_code = serializers.IntegerField()

    def validate(self, attrs: dict):
        pin_code = attrs.get("pin_code")

        try:
            pin = PinCode.objects.get(pin=pin_code)
            attrs["pin"] = pin
        except Exception as e:
            raise serializers.ValidationError("pin doesn't exist")

        return attrs


class ErrorSerializer(serializers.Serializer):
    message = serializers.CharField()


class EmailValidSerializer(serializers.Serializer):
    email = serializers.EmailField()

    def validate(self, attrs: dict):
        email = attrs.get("email")

        try:
            User.objects.get(email=email)
        except Exception as e:
            print(e)
            raise serializers.ValidationError("account doesn't exist")

        return attrs


class PhoneNumberValidSerializer(serializers.Serializer):
    phone_number = serializers.CharField()

    def validate(self, attrs: dict):
        phone_number = attrs.get("phone_number")

        try:
            User.objects.get(phone_number=phone_number)
        except Exception as e:
            print(e)
            raise serializers.ValidationError("account doesn't exist")

        return attrs
