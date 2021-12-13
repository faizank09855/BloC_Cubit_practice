import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_with_cubit/calculator/model/home_screen_model.dart';
import 'package:bloc_with_cubit/calculator/repository/home_screen_repository.dart';
import 'package:equatable/equatable.dart';


part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent , CounterState> {
  HomeScreenRepository repository;

  CounterBloc({required this.repository}) : super(IntialCounterState());



 @override
  CounterState get initialState => IntialCounterState();

 @override
  Stream<CounterState> mapEventToState(CounterEvent event) async*{
   if(event is FetchCounterEvent){
     yield CounterLoadingState();
     try{
     List<HomeScreenModel> Counter = await repository.getData();
     yield CounterLoadedState(Counter: Counter);}catch(e){
       yield CounterErrorState(ErrorMsg: e.toString());
     }
   }
 }
}