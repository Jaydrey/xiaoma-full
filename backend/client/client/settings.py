from pathlib import Path
from decouple import config
from datetime import timedelta

BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = config('SECRET_KEY', cast=str)

DEBUG = config('DEBUG', cast=str)

ALLOWED_HOSTS = config('ALLOWED_HOSTS', default='', cast=str).split(',')


INSTALLED_APPS = [
    'daphne',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # third party
    # 'graphene_django',
    'rest_framework',
    'drf_spectacular',
    'corsheaders',
    'rest_framework_simplejwt',
    'django_otp',
    'django_otp.plugins.otp_totp',
    # 'graphql_auth',
    'django_filters',
    'django_twilio',
    # apps
    'accounts.apps.AccountsConfig',
    'app_settings.apps.AppSettingsConfig',
    'authenticate.apps.AuthenticateConfig',
    'locations.apps.LocationsConfig',
    'trips.apps.TripsConfig',
    'users.apps.UsersConfig',

]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django_otp.middleware.OTPMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'client.urls'
AUTH_USER_MODEL = 'users.User'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'client.wsgi.application'
ASGI_APPLICATION = 'client.asgi.application'


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


LANGUAGE_CODE = config('LANGUAGE_CODE', cast=str)

TIME_ZONE = config('TIME_ZONE', cast=str)

USE_I18N = config('USE_I18N', cast=bool)

USE_TZ = config('USE_TZ', cast=bool)


STATIC_URL = 'static/'

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# backends
AUTHENTICATION_BACKENDS = [
    'django.contrib.auth.backends.ModelBackend',
    # 'django_otp.backends.OTPTokenBackend',
]

# emails
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = config('EMAIL_HOST', cast=str)
EMAIL_PORT = config('EMAIL_PORT', cast=int)
EMAIL_USE_TLS = config('EMAIL_USE_TLS', cast=bool)
EMAIL_HOST_USER = config('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = config('EMAIL_HOST_PASSWORD')

# twilio
TWILIO_ACCOUNT_SID = config('TWILIO_ACCOUNT_SID', cast=str)
TWILIO_AUTH_TOKEN = config('TWILIO_AUTH_TOKEN', cast=str)
TWILIO_PHONE_NUMBER = config('TWILIO_PHONE_NUMBER', cast=str)

# cors
# CORS_ALLOWED_ORIGINS = config('CORS_ALLOWED_ORIGINS', default='', cast=str).split(',')
CORS_ALLOW_ALL_ORIGINS = True

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ),
    'DEFAULT_SCHEMA_CLASS': 'drf_spectacular.openapi.AutoSchema',
}

SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(minutes=60),
    'SLIDING_TOKEN_REFRESH_LIFETIME': timedelta(days=1),
    'SLIDING_TOKEN_LIFETIME': timedelta(days=1),
    'SLIDING_TOKEN_REFRESH_LIFETIME_GRACE_PERIOD': timedelta(days=2),
    'SLIDING_TOKEN_REFRESH_SCOPE': None,
    'SLIDING_TOKEN_TYPES': {'access': 'a', 'refresh': 'r'},
}

SPECTACULAR_SETTINGS = {
    'TITLE': 'Xiaoma API',
    'DESCRIPTION': 'Xiaoma is a cab hailing application',
    'VERSION': '1.0.0',
    # OTHER SETTINGS
}

GRAPHENE = {
    'SCHEMA': 'client.schema.schema',
}

GOOGLE_API_KEY = config('GOOGLE_API_KEY', cast=str)
