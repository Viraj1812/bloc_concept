import 'package:bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:bloc_concept/presentation/home_page.dart';
import 'package:bloc_concept/presentation/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit counterCubit = CounterCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: counterCubit,
                child: const MyHomePage(
                  title: 'Flutter Demo Home Page',
                ),
              ),
          '/second': (context) => BlocProvider.value(
                value: counterCubit,
                child: const SecondScreen(
                  title: 'Second Screen',
                  color: Colors.red,
                ),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }
}
