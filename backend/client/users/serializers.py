from django.utils import timezone
from django.contrib.gis.geos import Point
from rest_framework import serializers

from .models import User, Gender  # Status


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            "id",
            "email",
            "phone_number",
            "username",
            "first_name",
            "last_name",
            "profile_picture",
            "date_of_birth",
            "gender",
            "is_active",
            "created_at",
        )


class CreateUserSerializer(serializers.ModelSerializer):
    gender = serializers.PrimaryKeyRelatedField(
        queryset=Gender.objects.all(),
        required=True,
        allow_null=False,
    )
    current_location = serializers.JSONField()

    class Meta:
        model = User
        fields = (
            "id",
            "email",
            "phone_number",
            "username",
            "first_name",
            "last_name",
            "profile_picture",
            "date_of_birth",
            "gender",
            "current_location",
            "is_active",
            "created_at",
        )
        read_only_fields = (
            "id",
            "username",
            "is_active",
            "created_at",
        )

    def create(self, validated_data: dict):
        current_location_data: dict = validated_data.pop(
            "current_location", None)
        if current_location_data:
            latitude = current_location_data.get("lat")
            longitude = current_location_data.get("lng")
            current_location = Point(x=latitude, y=longitude)
            validated_data["current_location"] = current_location
        user: User | None = User.objects.create_user(**validated_data)
        return user


class CreateGenderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Gender
        fields = ("id", "type")
        read_only_fields = ("id",)

    def validate(self, data: dict):
        gender_type: str = data.get("type")
        if gender_type is None:
            raise ValueError("Gender type field is required")
        if Gender.objects.filter(type=gender_type.lower()).exists():
            raise ValueError("Gender type with this name already exists")

        return data

    def create(self, validated_data: dict):
        gender_type: str = validated_data.get("type")
        gender = Gender.objects.create(type=gender_type.lower())
        return gender


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
    current_location = serializers.JSONField()

    class Meta:
        model = User
        fields = ("id", "current_location")

    def update(self, instance: User, validated_data: dict):
        if instance is None:
            raise ValueError("The user object is not found")

        current_location_data: dict = validated_data.get(
            "current_location")
        if current_location_data is None:
            raise ValueError("Provide the current location")

        latitude = current_location_data.get("lat")
        longitude = current_location_data.get("lng")
        print(f"{latitude=}, {longitude}")
        current_location = Point(x=latitude, y=longitude)
        print(current_location.coords)
        instance.current_location = current_location
        instance.updated_at = timezone.now()
        instance.save()
        # trigger the socket consumer to broadcast user's location
        return instance

# class CreateStatusSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Status
#         fields = ("id", "type")
#         read_only_fields = ("id",)

#     def validate(self, data: dict):
#         status_type: str = data.get("type")
#         if status_type is None:
#             raise ValueError("Status type field is required")
#         if Status.objects.filter(type=status_type.lower()).exists():
#             raise ValueError("Status type with this name already exists")

#         return data

#     def create(self, validated_data: dict):
#         status_type: str = validated_data.get("type")
#         status = Status.objects.create(type=status_type.lower())
#         return status
