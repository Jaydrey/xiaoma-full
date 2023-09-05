// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapScreenStore on _MapScreenStore, Store {
  Computed<LatLng>? _$pointAComputed;

  @override
  LatLng get pointA => (_$pointAComputed ??=
          Computed<LatLng>(() => super.pointA, name: '_MapScreenStore.pointA'))
      .value;
  Computed<LatLng>? _$pointBComputed;

  @override
  LatLng get pointB => (_$pointBComputed ??=
          Computed<LatLng>(() => super.pointB, name: '_MapScreenStore.pointB'))
      .value;

  late final _$currentLocationAtom =
      Atom(name: '_MapScreenStore.currentLocation', context: context);

  @override
  LatLng get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(LatLng value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: '_MapScreenStore.currentPosition', context: context);

  @override
  Position? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$avatarIconAtom =
      Atom(name: '_MapScreenStore.avatarIcon', context: context);

  @override
  BitmapDescriptor get avatarIcon {
    _$avatarIconAtom.reportRead();
    return super.avatarIcon;
  }

  @override
  set avatarIcon(BitmapDescriptor value) {
    _$avatarIconAtom.reportWrite(value, super.avatarIcon, () {
      super.avatarIcon = value;
    });
  }

  late final _$driverIconAtom =
      Atom(name: '_MapScreenStore.driverIcon', context: context);

  @override
  BitmapDescriptor get driverIcon {
    _$driverIconAtom.reportRead();
    return super.driverIcon;
  }

  @override
  set driverIcon(BitmapDescriptor value) {
    _$driverIconAtom.reportWrite(value, super.driverIcon, () {
      super.driverIcon = value;
    });
  }

  late final _$activeDriverPositionAtom =
      Atom(name: '_MapScreenStore.activeDriverPosition', context: context);

  @override
  Position? get activeDriverPosition {
    _$activeDriverPositionAtom.reportRead();
    return super.activeDriverPosition;
  }

  @override
  set activeDriverPosition(Position? value) {
    _$activeDriverPositionAtom.reportWrite(value, super.activeDriverPosition,
        () {
      super.activeDriverPosition = value;
    });
  }

  late final _$activeUserPositionAtom =
      Atom(name: '_MapScreenStore.activeUserPosition', context: context);

  @override
  Position? get activeUserPosition {
    _$activeUserPositionAtom.reportRead();
    return super.activeUserPosition;
  }

  @override
  set activeUserPosition(Position? value) {
    _$activeUserPositionAtom.reportWrite(value, super.activeUserPosition, () {
      super.activeUserPosition = value;
    });
  }

  late final _$selectedSourcePlaceAtom =
      Atom(name: '_MapScreenStore.selectedSourcePlace', context: context);

  @override
  PlaceModel? get selectedSourcePlace {
    _$selectedSourcePlaceAtom.reportRead();
    return super.selectedSourcePlace;
  }

  @override
  set selectedSourcePlace(PlaceModel? value) {
    _$selectedSourcePlaceAtom.reportWrite(value, super.selectedSourcePlace, () {
      super.selectedSourcePlace = value;
    });
  }

  late final _$selectedDestinationPlaceAtom =
      Atom(name: '_MapScreenStore.selectedDestinationPlace', context: context);

  @override
  PlaceModel? get selectedDestinationPlace {
    _$selectedDestinationPlaceAtom.reportRead();
    return super.selectedDestinationPlace;
  }

  @override
  set selectedDestinationPlace(PlaceModel? value) {
    _$selectedDestinationPlaceAtom
        .reportWrite(value, super.selectedDestinationPlace, () {
      super.selectedDestinationPlace = value;
    });
  }

  late final _$driversListPsotionsAtom =
      Atom(name: '_MapScreenStore.driversListPsotions', context: context);

  @override
  ObservableList<Position> get driversListPsotions {
    _$driversListPsotionsAtom.reportRead();
    return super.driversListPsotions;
  }

  @override
  set driversListPsotions(ObservableList<Position> value) {
    _$driversListPsotionsAtom.reportWrite(value, super.driversListPsotions, () {
      super.driversListPsotions = value;
    });
  }

  late final _$driversBitmapsAtom =
      Atom(name: '_MapScreenStore.driversBitmaps', context: context);

  @override
  ObservableList<BitmapDescriptor> get driversBitmaps {
    _$driversBitmapsAtom.reportRead();
    return super.driversBitmaps;
  }

  @override
  set driversBitmaps(ObservableList<BitmapDescriptor> value) {
    _$driversBitmapsAtom.reportWrite(value, super.driversBitmaps, () {
      super.driversBitmaps = value;
    });
  }

  late final _$predictedPlacesAtom =
      Atom(name: '_MapScreenStore.predictedPlaces', context: context);

  @override
  ObservableList<PlaceModel> get predictedPlaces {
    _$predictedPlacesAtom.reportRead();
    return super.predictedPlaces;
  }

  @override
  set predictedPlaces(ObservableList<PlaceModel> value) {
    _$predictedPlacesAtom.reportWrite(value, super.predictedPlaces, () {
      super.predictedPlaces = value;
    });
  }

  late final _$savedPlacesAtom =
      Atom(name: '_MapScreenStore.savedPlaces', context: context);

  @override
  ObservableList<PlaceModel> get savedPlaces {
    _$savedPlacesAtom.reportRead();
    return super.savedPlaces;
  }

  @override
  set savedPlaces(ObservableList<PlaceModel> value) {
    _$savedPlacesAtom.reportWrite(value, super.savedPlaces, () {
      super.savedPlaces = value;
    });
  }

  late final _$hasLocationPermissionAtom =
      Atom(name: '_MapScreenStore.hasLocationPermission', context: context);

  @override
  bool get hasLocationPermission {
    _$hasLocationPermissionAtom.reportRead();
    return super.hasLocationPermission;
  }

  @override
  set hasLocationPermission(bool value) {
    _$hasLocationPermissionAtom.reportWrite(value, super.hasLocationPermission,
        () {
      super.hasLocationPermission = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MapScreenStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$avatarPicAtom =
      Atom(name: '_MapScreenStore.avatarPic', context: context);

  @override
  String get avatarPic {
    _$avatarPicAtom.reportRead();
    return super.avatarPic;
  }

  @override
  set avatarPic(String value) {
    _$avatarPicAtom.reportWrite(value, super.avatarPic, () {
      super.avatarPic = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_MapScreenStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$sourceQueryAtom =
      Atom(name: '_MapScreenStore.sourceQuery', context: context);

  @override
  String get sourceQuery {
    _$sourceQueryAtom.reportRead();
    return super.sourceQuery;
  }

  @override
  set sourceQuery(String value) {
    _$sourceQueryAtom.reportWrite(value, super.sourceQuery, () {
      super.sourceQuery = value;
    });
  }

  late final _$destinationQueryAtom =
      Atom(name: '_MapScreenStore.destinationQuery', context: context);

  @override
  String get destinationQuery {
    _$destinationQueryAtom.reportRead();
    return super.destinationQuery;
  }

  @override
  set destinationQuery(String value) {
    _$destinationQueryAtom.reportWrite(value, super.destinationQuery, () {
      super.destinationQuery = value;
    });
  }

  late final _$searchFieldStatusAtom =
      Atom(name: '_MapScreenStore.searchFieldStatus', context: context);

  @override
  MapSearchFieldStatus get searchFieldStatus {
    _$searchFieldStatusAtom.reportRead();
    return super.searchFieldStatus;
  }

  @override
  set searchFieldStatus(MapSearchFieldStatus value) {
    _$searchFieldStatusAtom.reportWrite(value, super.searchFieldStatus, () {
      super.searchFieldStatus = value;
    });
  }

  late final _$handleLocationPermissionAsyncAction =
      AsyncAction('_MapScreenStore.handleLocationPermission', context: context);

  @override
  Future<void> handleLocationPermission() {
    return _$handleLocationPermissionAsyncAction
        .run(() => super.handleLocationPermission());
  }

  late final _$processUserBitmapIconAsyncAction =
      AsyncAction('_MapScreenStore.processUserBitmapIcon', context: context);

  @override
  Future<void> processUserBitmapIcon() {
    return _$processUserBitmapIconAsyncAction
        .run(() => super.processUserBitmapIcon());
  }

  late final _$processDriverBitmapIconsAsyncAction =
      AsyncAction('_MapScreenStore.processDriverBitmapIcons', context: context);

  @override
  Future<BitmapDescriptor?> processDriverBitmapIcons({required String image}) {
    return _$processDriverBitmapIconsAsyncAction
        .run(() => super.processDriverBitmapIcons(image: image));
  }

  late final _$handlePlaceAutoCompletionAsyncAction = AsyncAction(
      '_MapScreenStore.handlePlaceAutoCompletion',
      context: context);

  @override
  Future<void> handlePlaceAutoCompletion({required String query}) {
    return _$handlePlaceAutoCompletionAsyncAction
        .run(() => super.handlePlaceAutoCompletion(query: query));
  }

  late final _$_MapScreenStoreActionController =
      ActionController(name: '_MapScreenStore', context: context);

  @override
  void resetFields() {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.resetFields');
    try {
      return super.resetFields();
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleSearchFieldStatus({required MapSearchFieldStatus value}) {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.handleSearchFieldStatus');
    try {
      return super.handleSearchFieldStatus(value: value);
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleSourceQuery({required String value}) {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.handleSourceQuery');
    try {
      return super.handleSourceQuery(value: value);
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleDestinationQuery({required String value}) {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.handleDestinationQuery');
    try {
      return super.handleDestinationQuery(value: value);
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleUserPosition({required Position? value}) {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.handleUserPosition');
    try {
      return super.handleUserPosition(value: value);
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleSelectedSourcePlace({required PlaceModel? value}) {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.handleSelectedSourcePlace');
    try {
      return super.handleSelectedSourcePlace(value: value);
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleSelectedDestinationPlace({required PlaceModel? value}) {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.handleSelectedDestinationPlace');
    try {
      return super.handleSelectedDestinationPlace(value: value);
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleCurrentLocation() {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.handleCurrentLocation');
    try {
      return super.handleCurrentLocation();
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void configureLocationSettings() {
    final _$actionInfo = _$_MapScreenStoreActionController.startAction(
        name: '_MapScreenStore.configureLocationSettings');
    try {
      return super.configureLocationSettings();
    } finally {
      _$_MapScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation},
currentPosition: ${currentPosition},
avatarIcon: ${avatarIcon},
driverIcon: ${driverIcon},
activeDriverPosition: ${activeDriverPosition},
activeUserPosition: ${activeUserPosition},
selectedSourcePlace: ${selectedSourcePlace},
selectedDestinationPlace: ${selectedDestinationPlace},
driversListPsotions: ${driversListPsotions},
driversBitmaps: ${driversBitmaps},
predictedPlaces: ${predictedPlaces},
savedPlaces: ${savedPlaces},
hasLocationPermission: ${hasLocationPermission},
isLoading: ${isLoading},
avatarPic: ${avatarPic},
message: ${message},
sourceQuery: ${sourceQuery},
destinationQuery: ${destinationQuery},
searchFieldStatus: ${searchFieldStatus},
pointA: ${pointA},
pointB: ${pointB}
    ''';
  }
}
