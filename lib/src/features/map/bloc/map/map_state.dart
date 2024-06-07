part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class ProgressMapState extends MapState {}

final class SuccessfulMapState extends MapState {
  final List<MapPointDto> points;

  const SuccessfulMapState({
    required this.points,
  });
}

final class ErrorMapState extends MapState {}

final class IdleMapState extends MapState {}
