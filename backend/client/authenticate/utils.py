from random import randrange
from django.core.mail import send_mail
from django.conf import settings

# twilio
from twilio.rest import Client


from accounts.models import Account
from .models import PinCode

def registration_email(account: Account, pin: int):
    subject = f"Congratulations {account.user.first_name.title()}! Your registration was successful."
    message = f'''
To activate your account and start exploring our platform, please use the following OTP Code

OTP CODE: {pin}

Please note that this PIN is valid for a limited time.

If you haven't requested this registration, please ignore this message.

Thank you for choosing Xiaoma.

Best regards,

The Xiaoma Team.
'''
    from_email = settings.EMAIL_HOST_USER
    recipient_list = [f'{account.user.email}']
    send_mail(subject, message, from_email, recipient_list)
    print("Email sent successfully")
    return "Email sent successfully"

# def registration_otp_message(account: Account, pin: int):
#     print(f'account sid {settings.TWILIO_ACCOUNT_SID}, auth token {settings.TWILIO_AUTH_TOKEN}')
#     client = Client(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
#     to: str = f'+254{account.user.phone_number[1:]}'
#     body = f'Your Xiaoma verification code is : {pin}'
#     from_ = settings.TWILIO_PHONE_NUMBER
#     message = client.messages.create(
#         body=body,
#         from_=from_,
#         to=to
#     )


def generate_code() -> int:
    while True:
        pin_code = ''.join(str(randrange(10)) for _ in range(4))
        pin = PinCode.objects.filter(pin=int(pin_code))
        if not pin.exists():
            PinCode.objects.create(pin=int(pin_code))
            return int(pin_code)

