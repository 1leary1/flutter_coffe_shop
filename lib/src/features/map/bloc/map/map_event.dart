part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

final class LoadPointsEvent extends MapEvent {
  const LoadPointsEvent();
}
