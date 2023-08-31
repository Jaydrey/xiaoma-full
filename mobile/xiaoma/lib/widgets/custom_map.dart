// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? radius;
  final double height;
  final double width;
  final BoxBorder? border;
  final LatLng sourceLocation;
  final LatLng destinationLocation;
  const CustomMap({
    super.key,
    this.borderRadius,
    this.border,
    this.radius,
    required this.sourceLocation,
    required this.destinationLocation,
    required this.height,
    required this.width,
  });

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  // controllers
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> polylineCoordinates = [];
  Future<void> getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyA9MYW9aGAswAXJx1m8ysKsig7A6Si5fM4",
      PointLatLng(
        widget.sourceLocation.latitude,
        widget.sourceLocation.longitude,
      ),
      PointLatLng(
        widget.destinationLocation.latitude,
        widget.destinationLocation.longitude,
      ),
    );
    print("result ${result.errorMessage}");
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      print("polylinecoordinate ${polylineCoordinates}");
      setState(() {});
    }
    print("polylinecoordinate ${polylineCoordinates}");
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getPolyPoints();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: widget.border ?? Border.all(width: 0, style: BorderStyle.none),
        borderRadius:
            widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 15),
      ),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.sourceLocation,
          zoom: 13,
        ),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: const MarkerId("source"),
            position: widget.sourceLocation,
          ),
          Marker(
            markerId: const MarkerId("destination"),
            position: widget.destinationLocation,
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: const Color(0xFF7B61FF),
            width: 6,
          ),
        },
      ),
    );
  }
}
