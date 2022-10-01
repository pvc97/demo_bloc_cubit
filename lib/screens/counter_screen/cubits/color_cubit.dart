import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo_bloc_cubit/screens/counter_screen/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  late final StreamSubscription counterSubscription;

  final CounterCubit counterCubit;
  ColorCubit({
    required this.counterCubit,
  }) : super(ColorState.initial()) {
    counterSubscription = counterCubit.stream.listen((counterState) {
      if (counterState.value % 2 == 0) {
        emit(state.copyWith(color: Colors.green));
      } else {
        emit(state.copyWith(color: Colors.red));
      }
    });
  }

  @override
  Future<void> close() {
    counterSubscription.cancel();
    return super.close();
  }
}
