import 'dart:convert';
import 'dart:io';

import 'package:coffe_shop/src/common/network/coffe_api.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';
import 'package:http/http.dart' as http;

abstract interface class IMapDataSource {
  Future<List<MapPointDto>> fetchPoints();
}

final class NetworkMapDataSource implements IMapDataSource {
  final http.Client _client;

  const NetworkMapDataSource({
    required http.Client client,
  }) : _client = client;

  @override
  Future<List<MapPointDto>> fetchPoints() async {
    final response =
        await _client.get(Uri.parse('${CoffeApi.baseUrl}v1/locations'));

    if (response.statusCode == 200) {
      final List<MapPointDto> pointsDto = [];
      for (var item in jsonDecode(utf8.decode(response.bodyBytes))['data']) {
        pointsDto.add(MapPointDto.fromJson(item));
      }

      return pointsDto;
    } else {
      throw const SocketException('Server is not response');
    }
  }
}
