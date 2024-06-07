import 'package:equatable/equatable.dart';

class PointModel extends Equatable {
  final String address;
  final double lat;
  final double lng;

  const PointModel({
    required this.address,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [address, lat, lng];
}
