import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:xiaoma/app/app.dart';
import 'package:xiaoma/map/models/models.dart';
import 'package:xiaoma/map/repository/repository.dart';
import 'package:xiaoma/utils/google_map_functions.dart';
import 'package:xiaoma/utils/loggings.dart';

part 'map_screen_store.g.dart';

class MapScreenStore = _MapScreenStore with _$MapScreenStore;

abstract class _MapScreenStore with Store {
  late LocationSettings locationSettings;
  _MapScreenStore({
    required this.mapsFunctions,
    required this.mapsRepo,
  }) {
    // configureLocationSettings();
  }

  final GoogleMapsFunctions mapsFunctions;
  final MapsRepo mapsRepo;

  @observable
  LatLng currentLocation = const LatLng(-1.262550, 36.788898);

  @observable
  Position? currentPosition;

  @observable
  BitmapDescriptor avatarIcon = BitmapDescriptor.defaultMarker;

  @observable
  BitmapDescriptor driverIcon = BitmapDescriptor.defaultMarker;

  @observable
  Position? activeDriverPosition;

  @observable
  Position? activeUserPosition;

  @observable
  PlaceModel? selectedSourcePlace;

  @observable
  PlaceModel? selectedDestinationPlace;

  @observable
  ObservableList<Position> driversListPsotions = ObservableList.of([]);

  @observable
  ObservableList<BitmapDescriptor> driversBitmaps = ObservableList.of([]);

  @observable
  ObservableList<PlaceModel> predictedPlaces =
      ObservableList<PlaceModel>.of([]);

  @observable
  ObservableList<PlaceModel> savedPlaces = ObservableList<PlaceModel>.of([]);

  @observable
  bool hasLocationPermission = false;

  @observable
  bool isLoading = false;

  @observable
  String avatarPic = "assets/image_2.png";

  @observable
  String message = "";

  @observable
  String sourceQuery = "";

  @observable
  String destinationQuery = "";

  @observable
  MapSearchFieldStatus searchFieldStatus = MapSearchFieldStatus.saved;

  @computed
  LatLng get pointA => GoogleMapsFunctions().calculateCoordinates(
      startPoint: currentLocation, distance: .2, bearing: 0);

  @computed
  LatLng get pointB => GoogleMapsFunctions().calculateCoordinates(
        startPoint: currentLocation,
        distance: .2,
        bearing: 90,
      );

  @action
  void resetFields() {
    searchFieldStatus = MapSearchFieldStatus.saved;
    sourceQuery = "";
    destinationQuery = "";
    selectedSourcePlace = null;
    selectedDestinationPlace = null;
    predictedPlaces.clear();
  }

  @action
  void handleSearchFieldStatus({required MapSearchFieldStatus value}) {
    searchFieldStatus = value;
  }

  @action
  void handleSourceQuery({required String value}) {
    sourceQuery = value;
  }

  @action
  void handleDestinationQuery({required String value}) {
    destinationQuery = value;
  }

  @action
  void handleUserPosition({required Position? value}) {
    currentPosition = value ?? currentPosition;
    handleCurrentLocation();
  }

  @action
  void handleSelectedSourcePlace({required PlaceModel? value}) {
    selectedSourcePlace = value;
  }

  @action
  void handleSelectedDestinationPlace({required PlaceModel? value}) {
    selectedDestinationPlace = value;
  }

  @action
  void handleCurrentLocation() {
    if (currentPosition == null) {
      return;
    }
    currentLocation = LatLng(
      currentPosition?.latitude ?? currentLocation.latitude,
      currentPosition?.longitude ?? currentLocation.longitude,
    );
  }

  @action
  void configureLocationSettings() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: "Running in Background",
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }
  }

  @action
  Future<void> handleLocationPermission() async {
    final permissionStatus = await Geolocator.checkPermission();
    switch (permissionStatus) {
      case LocationPermission.always:
        {
          hasLocationPermission = true;
          message = "Location Permission Granted";
        }
        break;
      case LocationPermission.whileInUse:
        {
          hasLocationPermission = true;
          message = "Location Permission Granted";
        }
        break;
      case LocationPermission.denied:
        {
          final status = await Geolocator.requestPermission();
          if (status == LocationPermission.always ||
              status == LocationPermission.whileInUse) {
            hasLocationPermission = true;
            message = "Location Permission Granted";
            return;
          }
          message = "Location Permission Denied";
          return;
        }
      case LocationPermission.deniedForever:
        {
          final status = await Geolocator.requestPermission();
          if (status == LocationPermission.always ||
              status == LocationPermission.whileInUse) {
            hasLocationPermission = true;
            message = "Location Permission Granted";
            return;
          }
          message = "Location Permission Denied";
          return;
        }

      case LocationPermission.unableToDetermine:
        {
          final status = await Geolocator.requestPermission();
          if (status == LocationPermission.always ||
              status == LocationPermission.whileInUse) {
            hasLocationPermission = true;
            message = "Location Permission Granted";
            return;
          }
          message = "Location Permission Denied";
          return;
        }
    }
  }

  @action
  Future<void> processUserBitmapIcon() async {
    XiamaLogger.debugPrint("image $avatarPic");
    final _imageBytes =
        await mapsFunctions.convertImagetoBytes(image: avatarPic);
    if (_imageBytes != null) {
      final _resizedBytes = mapsFunctions.resizeImage(
        data: _imageBytes,
        width: 120,
        height: 120,
      );
      avatarIcon = BitmapDescriptor.fromBytes(_resizedBytes!);
    }
  }

  @action
  Future<BitmapDescriptor?> processDriverBitmapIcons(
      {required String image}) async {
    final _imageBytes = await mapsFunctions.convertImagetoBytes(image: image);
    if (_imageBytes != null) {
      final _resizedBytes = mapsFunctions.resizeImage(
        data: _imageBytes,
        width: 120,
        height: 120,
      );
      driverIcon = BitmapDescriptor.fromBytes(_resizedBytes!);
      return driverIcon;
    }
    return null;
  }

  @action
  Future<void> handlePlaceAutoCompletion({required String query}) async {
    isLoading = true;
    final places = await mapsRepo.getPlacesAutoComplete(
      query: query,
    );
    if (places == null) {
      message = "Couldn't load places";
      isLoading = false;
      return;
    }
    message = "Places retrieved successfully";
    predictedPlaces.clear();
    for (var place in places) {
      predictedPlaces.add(place);
    }
    isLoading = false;
    return;
  }
}

enum DriverDirection { left, top, right, bottom }
