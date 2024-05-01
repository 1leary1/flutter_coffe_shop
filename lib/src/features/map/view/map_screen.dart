import 'package:coffe_shop/src/common/database/database.dart';
import 'package:coffe_shop/src/features/map/bloc/map/map_bloc.dart';
import 'package:coffe_shop/src/features/map/data/data_sources/map_data_source.dart';
import 'package:coffe_shop/src/features/map/data/data_sources/savable_map_data_source.dart';
import 'package:coffe_shop/src/features/map/data/map_repository.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';
import 'package:coffe_shop/src/features/map/view/widgets/addresses_screen.dart';
import 'package:coffe_shop/src/features/map/view/widgets/point_bottom_sheet.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:coffe_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;

  late final AppDatabase _appDb;
  late final NetworkMapDataSource _networkMapkDS;
  late final DbMapDataSource _dbMapDS;
  late final MapRepository _mapRepository;
  late final MapBloc _mapBloc;
  static const CameraPosition defaultPosition = CameraPosition(
    target: Point(
      latitude: 55.028858,
      longitude: 73.279944,
    ),
    zoom: 2,
  );

  List<PlacemarkMapObject> _getPlacemarkObjects(
      List<MapPointDto> pointsDto, BuildContext context, MapBloc mapBloc) {
    return pointsDto
        .map(
          (point) => PlacemarkMapObject(
              mapId: MapObjectId('MapObject $point'),
              point: Point(latitude: point.lat, longitude: point.lng),
              opacity: 1,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage(
                    ImageSources.point,
                  ),
                  scale: 0.1,
                ),
              ),
              onTap: (_, __) {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (context) => PointBottomSheet(
                    mapBloc: mapBloc,
                    point: point,
                  ),
                );
                _mapController.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: Point(
                        latitude: point.lat,
                        longitude: point.lng,
                      ),
                      zoom: 15,
                    ),
                  ),
                );
              }),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _appDb = AppDatabase();
    _networkMapkDS = NetworkMapDataSource(client: http.Client());
    _dbMapDS = DbMapDataSource(menuDb: _appDb);
    _mapRepository = MapRepository(
      networkMapDataSource: _networkMapkDS,
      dbMapDataSource: _dbMapDS,
    );
    _mapBloc = MapBloc(mapRepository: _mapRepository);
    _mapBloc.add(const LoadPointsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _mapBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  color: AppColors.white,
                  icon: const Icon(
                    Icons.reorder,
                    color: AppColors.black,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressesScreen(
                        mapBloc: _mapBloc,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<MapBloc, MapState>(
          bloc: _mapBloc,
          builder: (context, state) {
            if (state is SuccessfulMapState) {
              return YandexMap(
                  onMapCreated: (controller) async {
                    _mapController = controller;
                    await _mapController.moveCamera(
                      CameraUpdate.newCameraPosition(
                        defaultPosition,
                      ),
                    );
                  },
                  mapObjects:
                      _getPlacemarkObjects(state.points, context, _mapBloc));
            }
            return YandexMap(
              onMapCreated: (controller) async {
                _mapController = controller;
                await _mapController.moveCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      target: Point(
                        latitude: 54.984579,
                        longitude: 73.374383,
                      ),
                      zoom: 10,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
