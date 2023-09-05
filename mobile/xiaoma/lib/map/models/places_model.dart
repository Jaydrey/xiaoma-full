// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:xiaoma/app/constants/constants.dart';

class PlaceModel {
  final String? placeId;
  final String? reference;
  final String? description;
  final String? name;
  final String? address;
  final double? distance;
  final UnitDistance? unit;

  PlaceModel({
    this.placeId,
    this.reference,
    this.description,
    this.name,
    this.address,
    this.distance,
    this.unit,
  });

  PlaceModel copyWith({
    String? placeId,
    String? reference,
    String? description,
    String? name,
    String? street,
    double? distance,
    UnitDistance? unit,
  }) {
    return PlaceModel(
      placeId: placeId ?? this.placeId,
      reference: reference ?? this.reference,
      description: description ?? this.description,
      name: name ?? this.name,
      address: street ?? this.address,
      distance: distance ?? this.distance,
      unit: unit ?? this.unit,
    );
  }

  @override
  String toString() {
    return 'PlaceModel(placeId: $placeId, reference: $reference, description: $description, name: $name, street: $address, distance: $distance, unit: $unit)';
  }

  static List<PlaceModel> get testPlaces => [
        PlaceModel(
          name: "University of Nairobi",
          address: "University way",
          distance: 2.9,
          unit: UnitDistance.km,
        ),
        PlaceModel(
          name: "Garden City Mall",
          address: "Thika Road, Nairobi",
          distance: 8.5,
          unit: UnitDistance.km,
        ),
        PlaceModel(
          name: "Karura Forest",
          address: "Limuru Road, Nairobi",
          distance: 11.9,
          unit: UnitDistance.km,
        )
      ];
}
