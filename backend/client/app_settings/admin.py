from django.contrib import admin

from .models import (
    AppSetting,
    Contact,
    Language,
)

class AppSettingAdmin(admin.ModelAdmin):
    pass

admin.site.register(AppSetting, AppSettingAdmin)

class ContactAdmin(admin.ModelAdmin):
    pass

admin.site.register(Contact, ContactAdmin)

class LanguageAdmin(admin.ModelAdmin):
    pass

admin.site.register(Language, LanguageAdmin)
