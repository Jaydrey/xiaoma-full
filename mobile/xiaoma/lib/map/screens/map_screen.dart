import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xiaoma/map/stores/map_screen_store.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class XiaoMaps extends StatefulWidget {
  const XiaoMaps({
    super.key,
  });

  @override
  State<XiaoMaps> createState() => _XiaoMapsState();
}

class _XiaoMapsState extends State<XiaoMaps> {
  //stores
  final MapScreenStore _mapScreenStore = locator<MapScreenStore>();
  // controller

  //states
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        XiamaLogger.debugPrint("pointA ${_mapScreenStore.pointA}");
        XiamaLogger.debugPrint("pointB ${_mapScreenStore.pointB}");
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _mapScreenStore.currentLocation,
            zoom: 18,
          ),
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
            if (!_mapScreenStore.hasLocationPermission) {
              Future.delayed(Duration.zero, () async {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return LocationBanner(
                        onPressedAllow: () async {
                          await _mapScreenStore.handleLocationPermission();
                          if (!_mapScreenStore.hasLocationPermission) {
                            _mapScreenStore.message =
                                "Couldn't get the position. No Permission.";
                            return;
                          }
                          Geolocator.getCurrentPosition(
                                  desiredAccuracy: LocationAccuracy.high,
                                  forceAndroidLocationManager: true)
                              .then((Position value) {
                            // currentPosition = value;
                            _mapScreenStore.handleUserPosition(value: value);
                          }).catchError((error) {
                            _mapScreenStore.handleUserPosition(value: null);
                            _mapScreenStore.message =
                                "Error occurred while getting position";
                            return;
                          });
                          _mapScreenStore.handleCurrentLocation();

                          Geolocator.getPositionStream(
                              locationSettings: const LocationSettings(
                            accuracy: LocationAccuracy.high,
                          )).listen((event) {
                            _mapScreenStore.handleUserPosition(value: event);
                            _mapScreenStore.handleCurrentLocation();
                            XiamaLogger.debugPrint(
                                "stream lat :${_mapScreenStore.currentPosition?.latitude}");
                            XiamaLogger.debugPrint(
                                "stream lng :${_mapScreenStore.currentPosition?.longitude}");
                            if (_mapController != null) {
                              try {
                                _mapController?.moveCamera(
                                    CameraUpdate.newLatLng(
                                        _mapScreenStore.currentLocation));
                              } catch (e) {
                                XiamaLogger.debugPrint("camera move error $e");
                              }
                            }
                          });
                          if (!mounted) return;
                          Navigator.of(context).pop();
                          return;
                        },
                        onPressedDeny: () {
                          Navigator.of(context).pop();
                        },
                      );
                    });
                setState(() {});
              });
            }
          },
          rotateGesturesEnabled: true,
          compassEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          circles: {
            Circle(
              circleId: const CircleId("avatar"),
              // strokeColor: XiamaColors.primaryColor,
              strokeWidth: 0,
              radius: 32,
              center: _mapScreenStore.currentLocation,
              fillColor: AppColors.primaryColor.withAlpha(60),
              zIndex: 10,
            ),
          },

          // myLocationEnabled: true,
          mapToolbarEnabled: true,
          markers: {
            Marker(
              markerId: const MarkerId("avatar"),
              position: _mapScreenStore.currentLocation,
              icon: _mapScreenStore.avatarIcon,
            ),
            Marker(
              markerId: const MarkerId("pointA"),
              position: _mapScreenStore.pointA,
              icon: _mapScreenStore.driverIcon,
            ),
            Marker(
              markerId: const MarkerId("pointB"),
              position: _mapScreenStore.pointB,
              icon: _mapScreenStore.driverIcon,
            ),
          },
        );
      },
    );
  }
}
