import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(state.copyWith(value: state.value + 1));
  }

  void decrement() {
    emit(state.copyWith(value: state.value - 1));
  }
}
