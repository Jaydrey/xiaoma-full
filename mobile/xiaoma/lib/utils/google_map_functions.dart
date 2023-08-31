import 'dart:math';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as IMG;
import 'package:permission_handler/permission_handler.dart';
import 'package:xiaoma/utils/utils.dart';

class GoogleMapsFunctions {
  Future<Position?> getLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      XiamaLogger.debugPrint("Error $e");
    }
    return null;
  }

  Future<PermissionStatus> requestLocationPermission() async {
    final _permissionStatus = await Permission.location.request();
    if (_permissionStatus.isGranted) {
      XiamaLogger.debugPrint("Location permission granted");
    } else if (_permissionStatus.isDenied) {
      XiamaLogger.debugPrint('Location permission denied');
    } else if (_permissionStatus.isPermanentlyDenied) {
      XiamaLogger.debugPrint('Location permission permanently denied');
    }

    return _permissionStatus;
  }

  LatLng calculateCoordinates({
    required LatLng startPoint,
    required double distance,
    required double bearing,
  }) {
    const double earthRadius = 6371.0;
    double lat1 = degreesToRadians(startPoint.latitude);
    double lon1 = degreesToRadians(startPoint.longitude);
    double angularDistance = distance / earthRadius;
    double bearingRadians = degreesToRadians(bearing);

    double lat2 = asin(sin(lat1) * cos(angularDistance) +
        cos(lat1) * sin(angularDistance) * cos(bearingRadians));
    double lon2 = lon1 +
        atan2(sin(bearingRadians) * sin(angularDistance) * cos(lat1),
            cos(angularDistance) - sin(lat1) * sin(lat2));

    // Convert back to degrees
    lat2 = radiansToDegrees(lat2);
    lon2 = radiansToDegrees(lon2);

    return LatLng(lat2, lon2);
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  double radiansToDegrees(double radians) {
    return radians * 180.0 / pi;
  }

  Uint8List? resizeImage({
    required Uint8List data,
    required int width,
    required int height,
  }) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    resizedData = Uint8List.fromList(IMG.encodePng(resized));
    return resizedData;
  }

  Future<Uint8List?> convertImagetoBytes({required String image}) async {
    ByteData? data;
    await rootBundle
        .load(image)
        .then((value) => data = value)
        .catchError((error) {
      XiamaLogger.debugPrint("Error occured $e");
    });
    final result = data?.buffer.asUint8List();
    return result;
  }
}
