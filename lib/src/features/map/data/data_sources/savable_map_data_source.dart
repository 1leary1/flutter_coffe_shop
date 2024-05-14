import 'package:coffe_shop/src/features/map/data/data_sources/map_data_source.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';
import 'package:coffe_shop/src/common/database/database.dart';

abstract interface class ISavableMapDataSource implements IMapDataSource {
  Future<void> savePoints({required List<MapPointDto> points});
}

final class DbMapDataSource implements ISavableMapDataSource {
  final AppDatabase _mapDb;

  const DbMapDataSource({required AppDatabase menuDb}) : _mapDb = menuDb;

  @override
  Future<List<MapPointDto>> fetchPoints() async {
    List<MapPoint> items = await _mapDb.select(_mapDb.mapPoints).get();

    return items.map((e) => MapPointDto.fromDb(e)).toList();
  }

  @override
  Future<void> savePoints({required List<MapPointDto> points}) async {
    await _mapDb.delete(_mapDb.mapPoints).go();
    for (var point in points) {
      await _mapDb.into(_mapDb.mapPoints).insert(
            MapPointsCompanion.insert(
              address: point.address,
              lat: point.lat,
              lng: point.lng,
            ),
          );
    }
  }
}
