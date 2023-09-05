from django.contrib import admin

from .models import User, Gender


class UserAdmin(admin.ModelAdmin):
    pass


admin.site.register(User, UserAdmin)


class GenderAdmin(admin.ModelAdmin):
    pass


admin.site.register(Gender, GenderAdmin)

