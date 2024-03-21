part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class CounterIncEvent extends CounterEvent {}

final class CounterDecEvent extends CounterEvent {}
