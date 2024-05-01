import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(NoAddressSelectedState()) {
    on<SetPointEvent>((event, emit) => _setPoint(event, emit));
    on<CheckAddressEvent>((event, emit) => _checkAdress(event, emit));
  }
  _setPoint(SetPointEvent event, Emitter<AddressState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('address', event.pointDto.address);
    emit(NoAddressSelectedState());
    emit(AddressSelectedState(address: event.pointDto.address));
  }

  _checkAdress(CheckAddressEvent event, Emitter<AddressState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? address = prefs.getString('address');
    if (address != null) {
      emit(AddressSelectedState(address: address));
    } else {
      emit(NoAddressSelectedState());
    }
  }
}
