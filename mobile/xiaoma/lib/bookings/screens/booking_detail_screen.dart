// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xiaoma/widgets/custom_map.dart';


class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({super.key});
  static const routeName = "/booking-details";

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  // state
  final sourceLocation = const LatLng(37.33500926, -122.03272188);
  final destinationLocation = const LatLng(37.33429383, -122.06600055);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: CustomMap(
        sourceLocation: sourceLocation,
        destinationLocation: destinationLocation,
        height: _size.height * .3,
        width: _size.width,
      ),
    );
  }
}
