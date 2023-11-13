from django.contrib import admin

from .models import Trip, TripStatus, CancellationReason


class TripAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "rider",
        "pickup_location",
        "dropoff_location",
        "status",
    )
    list_filter = ("status", )
    search_fields = ("rider", "start_location")


admin.site.register(Trip, TripAdmin)


class TripStatusAdmin(admin.ModelAdmin):
    pass


admin.site.register(TripStatus, TripStatusAdmin)


class CancellationReasonAdmin(admin.ModelAdmin):
    pass


admin.site.register(CancellationReason, CancellationReasonAdmin)
