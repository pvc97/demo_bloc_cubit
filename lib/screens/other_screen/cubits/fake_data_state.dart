part of 'fake_data_cubit.dart';

enum FakeDataStatus { initial, loading, success, failure }

class FakeDataState {
  final String data;
  final FakeDataStatus status;
  final String error;

  FakeDataState({
    required this.data,
    required this.status,
    required this.error,
  });

  factory FakeDataState.intial() {
    return FakeDataState(
      data: '',
      status: FakeDataStatus.initial,
      error: '',
    );
  }

  FakeDataState copyWith({
    String? data,
    FakeDataStatus? status,
    String? error,
  }) {
    return FakeDataState(
      data: data ?? this.data,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
