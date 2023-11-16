from django.utils import timezone
from django.contrib.gis.geos import Point
from django.contrib.auth import authenticate
from rest_framework import serializers


from users.models import User, Gender  # Status
from .models import PinCode

class LoginResponseSerializer(serializers.Serializer):
    access = serializers.CharField()
    refresh = serializers.CharField()
    
class CreateUserSerializer(serializers.ModelSerializer):
    gender = serializers.PrimaryKeyRelatedField(
        queryset=Gender.objects.all(),
        required=True,
        allow_null=True,
    )

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
    email = serializers.EmailField()
    password = serializers.CharField(write_only=True)

    def validate(self, data: dict):
        email = data.get('email')
        password = data.get('password')
        print(f'{data=}')
        print(f'{self.context.get("request")=}')
        user = authenticate(request=self.context.get(
            'request'), email=email, password=password)
        print(user)

        if not user:
            raise serializers.ValidationError("Invalid email or password.")

        return {
            'user': user
        }


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
    
    