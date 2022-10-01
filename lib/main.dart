import 'package:demo_bloc_cubit/screens/counter_screen/couter_screen.dart';
import 'package:demo_bloc_cubit/screens/counter_screen/cubit/color_cubit.dart';
import 'package:demo_bloc_cubit/screens/counter_screen/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(
          create: (context) => ColorCubit(
            counterCubit: context.read<CounterCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}
