import 'package:coffe_shop/src/common/database/database.dart';
import 'package:equatable/equatable.dart';

class MapPointDto extends Equatable {
  final String address;
  final double lat;
  final double lng;

  const MapPointDto({
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory MapPointDto.fromJson(Map<String, dynamic> json) {
    return MapPointDto(
      address: json["address"],
      lat: json["lat"],
      lng: json["lng"],
    );
  }

  @override
  List<Object?> get props => [address, lat, lng];

  static MapPointDto fromDb(MapPoint point) {
    return MapPointDto(
      address: point.address,
      lat: point.lat,
      lng: point.lng,
    );
  }
}
