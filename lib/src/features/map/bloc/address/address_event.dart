part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

final class SetPointEvent extends AddressEvent {
  final MapPointDto pointDto;

  const SetPointEvent({required this.pointDto});
}

final class CheckAddressEvent extends AddressEvent {}
