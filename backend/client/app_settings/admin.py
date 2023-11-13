from django.contrib import admin

from .models import (
    AppSetting,
    RideContact,
    Language,
)

class AppSettingAdmin(admin.ModelAdmin):
    pass

admin.site.register(AppSetting, AppSettingAdmin)

class RideContactAdmin(admin.ModelAdmin):
    pass

admin.site.register(RideContact, RideContactAdmin)

class LanguageAdmin(admin.ModelAdmin):
    pass

admin.site.register(Language, LanguageAdmin)
