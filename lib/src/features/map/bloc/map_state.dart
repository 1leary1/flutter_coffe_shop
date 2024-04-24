part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class ProgressMapState extends MapState {}

final class SuccessfulMenuState extends MapState {}

final class ErrorMapState extends MapState {}

final class IdleMapState extends MapState {}
