import 'package:coffe_shop/src/features/map/data/data_sources/map_data_source.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';
import 'package:coffe_shop/src/common/database/database.dart';

abstract interface class ISavableMapDataSource implements IMapDataSource {
  Future<void> savePoints({required List<MapPointDto> points});
}

final class DbMapDataSource implements ISavableMapDataSource {
  final AppDatabase _menuDb;

  const DbMapDataSource({required AppDatabase menuDb}) : _menuDb = menuDb;

  @override
  Future<List<MapPointDto>> fetchPoints() async {
    List<MapPoint> items = await _menuDb.select(_menuDb.mapPoints).get();

    return items.map((e) => MapPointDto.fromDb(e)).toList();
  }

  @override
  Future<void> savePoints({required List<MapPointDto> points}) async {
    await _menuDb.delete(_menuDb.mapPoints).go();
    for (var point in points) {
      await _menuDb.into(_menuDb.mapPoints).insert(
            MapPointsCompanion.insert(
              address: point.address,
              lat: point.lat,
              lng: point.lng,
            ),
          );
    }
  }
}
