import 'package:bloc_with_cubit/calculator/model/home_screen_model.dart';
import 'package:bloc_with_cubit/calculator/repository/home_screen_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CounterBloc( repository: HomeScreenRepository(),
              ),
      child: MaterialApp(
          home: Scaffold(
            body: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is IntialCounterState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CounterErrorState) {
                  return Center(child: Text(state.ErrorMsg));
                } else if (state is CounterLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is CounterLoadedState) {
                  return ListView.builder(itemCount: state.Counter!.length,
                    itemBuilder: (BuildContext context, pos) {
                      return ListTile(
                        title: Text(state.Counter![pos].title),
                      );
                    },);
                } else {
                  return Center(child: Text('error'));
                }
              },
            ),
          )),
    );
  }
}
