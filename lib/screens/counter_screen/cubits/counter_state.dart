part of 'counter_cubit.dart';

class CounterState {
  final int value;

  const CounterState({
    required this.value,
  });

  factory CounterState.initial() => const CounterState(value: 0);

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}
