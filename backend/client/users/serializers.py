from django.utils import timezone
from django.contrib.gis.geos import Point
from django.contrib.auth import authenticate
from rest_framework import serializers


from .models import (
    User, 
)

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        exclude = ("password",)
        read_only_fields = ("created_at", "id", "last_login")



class UpdateUserProfilePictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "profile_picture")

    def update(self, instance: User, validated_data: dict):
        if instance is None:
            raise ValueError("The user object is not found")

        profile_picture = validated_data.get("profile_picture")
        if profile_picture:
            instance.profile_picture = profile_picture

        instance.updated_at = timezone.now()
        instance.save()
        return instance


class UpdateUserNameSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            "id",
            "first_name",
            "last_name",
        )

    def update(self, instance: User = None, validated_data: dict = None):
        if instance is None:
            raise ValueError("The user object is not found")
        first_name = validated_data.get("first_name")
        last_name = validated_data.get("last_name")

        if first_name:
            instance.first_name = first_name
        if last_name:
            instance.last_name = last_name

        instance.updated_at = timezone.now()
        instance.save()
        return instance


class UpdateUserPhoneNumberSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "phone_number")

    def update(self, instance: User, validated_data: dict):
        if instance is None:
            raise ValueError("The user object is not found")

        phone_number = validated_data.get("phone_number")
        if phone_number is None:
            raise ValueError("Provide a phone number")

        instance.phone_number = phone_number
        if instance.username_type() == "phone number":
            instance.username = phone_number

        instance.updated_at = timezone.now()
        instance.save()
        return instance


class UpdateUserEmailSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "email")

    def update(self, instance: User, validated_data: dict):
        if instance is None:
            raise ValueError("The user object is not found")

        email = validated_data.get("email")
        if email is None:
            raise ValueError("Provide an email")

        instance.email = email
        if instance.username_type() == "phone number":
            instance.username = email

        instance.updated_at = timezone.now()
        instance.save()
        return instance


class UpdateUserCurrentLocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "current_location")

    def update(self, instance: User, validated_data: dict):
        print(f"{instance=}")
        if instance is None:
            raise ValueError("The user object is not found")

        current_location_data: str = validated_data.get(
            "current_location")
        if current_location_data is None:
            raise ValueError("Provide the current location")

        instance.current_location = current_location_data
        instance.updated_at = timezone.now()
        instance.save()
        # trigger the socket consumer to broadcast user's location
        return instance
