from django.db.models.signals import post_save
from django.dispatch import receiver

# models
from .models import Account

# utils
from authenticate.utils import registration_email, generate_code

@receiver(post_save, sender=Account)
def send_otp_email(sender: Account, instance: Account, created: bool, **kwargs):
    if not created:
        return None
    pin = generate_code()
    registration_email(instance, pin)
    print("Email sent")

    