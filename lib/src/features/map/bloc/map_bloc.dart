import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/features/map/data/map_repository.dart';
import 'package:equatable/equatable.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final IMapRepository _mapRepository;

  MapBloc({required IMapRepository mapRepository})
      : _mapRepository = mapRepository,
        super(ProgressMapState()) {
    on<LoadPointsEvent>((event, emit) => _loadPoints(event, emit));
  }

  _loadPoints(MapEvent event, Emitter<MapState> emit) {
    _mapRepository.loadPoints();
  }
}
