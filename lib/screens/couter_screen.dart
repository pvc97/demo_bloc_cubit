import 'package:demo_bloc_cubit/screens/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              bloc: _counterCubit,
              builder: (context, state) {
                return Text(
                  state.value.toString(),
                  style: const TextStyle(
                    fontSize: 60.0,
                  ),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _counterCubit.increment();
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _counterCubit.decrement();
                  },
                  child: const Text('-'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
