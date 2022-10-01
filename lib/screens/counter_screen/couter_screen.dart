import 'package:demo_bloc_cubit/screens/counter_screen/cubits/color_cubit.dart';
import 'package:demo_bloc_cubit/screens/counter_screen/cubits/counter_cubit.dart';
import 'package:demo_bloc_cubit/screens/other_screen/other_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.value == 5) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Counter is ${state.value}'),
              );
            },
          );
        } else if (state.value == 10) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OtherScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        appBar: AppBar(
          title: const Text('Counter Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
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
                      context.read<CounterCubit>().increment();
                    },
                    child: const Text('+'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    child: const Text('-'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
