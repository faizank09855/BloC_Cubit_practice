import 'dart:developer';

import 'dart:developer';

import 'package:bloc_with_cubit/calculator/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(state.a.toString());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(decrement());
                  }, child: Text('-')),
                  FloatingActionButton(onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(Increment());
                  }, child: Text('+')),
                ],
              )
            ],
          ),
        ));
  }
}
