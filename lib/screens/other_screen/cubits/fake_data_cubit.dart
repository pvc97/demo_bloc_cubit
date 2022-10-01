import 'package:bloc/bloc.dart';

part 'fake_data_state.dart';

class FakeDataCubit extends Cubit<FakeDataState> {
  FakeDataCubit() : super(FakeDataState.intial());

  Future<String> server() async {
    await Future.delayed(const Duration(seconds: 2));

    // throw Exception('Server 404');
    return 'Hello';
  }

  void getData() async {
    emit(state.copyWith(status: FakeDataStatus.loading));

    try {
      String result = await server();

      emit(state.copyWith(
        data: result,
        status: FakeDataStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FakeDataStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
