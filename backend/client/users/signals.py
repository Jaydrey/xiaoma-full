from django.db.models.signals import post_save
from django.dispatch import receiver

# utils
from authenticate.utils import generate_code, registration_otp_message

# models
from .models import User
from accounts.models import Account
from authenticate.models import PinCode

@receiver(post_save, sender=User)
def create_user_account(sender: User, instance: User, created: bool, **kwargs):
    if not created:
        return None
    
    try:
        account = Account.objects.create(user=instance)
        pin_code = generate_code()
        pin = PinCode.objects.filter(pin=pin_code)
        while pin.exists():
            pin_code = generate_code()
            pin = PinCode.objects.filter(pin=pin_code)
        new_pin = PinCode.objects.create(pin=pin_code)
        registration_otp_message(account, new_pin)
    except Exception as e:
        print(e)
        return None
    
    