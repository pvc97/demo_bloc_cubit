import 'package:demo_bloc_cubit/screens/other_screen/cubits/fake_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  final FakeDataCubit _fakeDataCubit = FakeDataCubit();

  @override
  void dispose() {
    _fakeDataCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other screen'),
      ),
      body: Center(
        child: BlocConsumer<FakeDataCubit, FakeDataState>(
          bloc: _fakeDataCubit,
          listener: (context, state) {
            if (state.status == FakeDataStatus.failure) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Error: ${state.error}'),
                  );
                },
              );
            }
          },
          builder: (context, state) {
            if (state.status == FakeDataStatus.loading) {
              return const CircularProgressIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.data),
                ElevatedButton(
                  onPressed: () {
                    _fakeDataCubit.getData();
                  },
                  child: const Text('Get Data'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
