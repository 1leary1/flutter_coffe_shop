part of 'address_bloc.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class NoAddressSelectedState extends AddressState {}

final class AddressSelectedState extends AddressState {
  final String address;

  const AddressSelectedState({
    required this.address,
  });
}
