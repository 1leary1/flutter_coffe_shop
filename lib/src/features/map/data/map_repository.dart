import 'dart:io';

import 'package:coffe_shop/src/features/map/data/data_sources/map_data_source.dart';
import 'package:coffe_shop/src/features/map/data/data_sources/savable_map_data_source.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';

abstract interface class IMapRepository {
  Future<List<MapPointDto>> loadPoints();
}

final class CategoriesRepository implements IMapRepository {
  final IMapDataSource _networkMapDataSource;
  final ISavableMapDataSource _dbMapDataSource;

  const CategoriesRepository({
    required IMapDataSource networkMapDataSource,
    required ISavableMapDataSource dbMapDataSource,
  })  : _networkMapDataSource = networkMapDataSource,
        _dbMapDataSource = dbMapDataSource;

  @override
  Future<List<MapPointDto>> loadPoints() async {
    var dtos = <MapPointDto>[];
    try {
      dtos = await _networkMapDataSource.fetchPoints();
      _dbMapDataSource.savePoints(points: dtos);
    } on SocketException {
      dtos = await _dbMapDataSource.fetchPoints();
    }
    return dtos;
  }
}
