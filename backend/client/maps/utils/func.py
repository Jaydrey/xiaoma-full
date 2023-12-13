from django.conf import settings
import googlemaps

def _map_init() -> googlemaps.Client | None:
    try:
        maps = googlemaps.Client(key=settings.GOOGLE_MAPS_API_KEY)
    except Exception as e:
        print(e)
        return None

def place_to_coordinates(place_name:str=None) -> tuple[float, float] | None:
    maps = _map_init()
    if maps is None:
        return None
    
    try:
        result = maps.geocode(place_name)
    except Exception as e:
        pass


def coordinates_to_places(coordinates: tuple[float, float]=None) ->str:
    maps = _map_init()
    if maps is None:
        return None
    
    