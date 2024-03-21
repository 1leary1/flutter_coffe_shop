import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    late int count = 0;
    on<CounterIncEvent>((event, emit) {
      if (state < 10) {
        emit(state + 1);
      }
    });
    on<CounterDecEvent>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });
  }
}
