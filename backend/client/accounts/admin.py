from django.contrib import admin

from .models import (
    Account,
    Status,
)


class AccountAdmin(admin.ModelAdmin):
    pass


admin.site.register(Account, AccountAdmin)


class StatusAdmin(admin.ModelAdmin):
    pass


admin.site.register(Status, StatusAdmin)
