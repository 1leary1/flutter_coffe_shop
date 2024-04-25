import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/features/map/data/map_repository.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final IMapRepository _mapRepository;

  MapBloc({
    required IMapRepository mapRepository,
  })  : _mapRepository = mapRepository,
        super(ProgressMapState()) {
    on<LoadPointsEvent>((event, emit) => _loadPoints(event, emit));
    //on<SetPointEvent>((event, emit) => _setPoint(event, emit));
  }

  _loadPoints(MapEvent event, Emitter<MapState> emit) async {
    emit(ProgressMapState());
    List<MapPointDto> points = await _mapRepository.loadPoints();
    emit(SuccessfulMapState(points: points));
  }
}
