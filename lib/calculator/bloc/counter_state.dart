part of 'counter_bloc.dart';


  class CounterState {

 }
 class IntialCounterState extends CounterState{
   @override
   // TODO: implement props
   List<Object?> get props => throw UnimplementedError();
 }

class CounterLoadingState extends CounterState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterLoadedState extends CounterState{
   List<HomeScreenModel>? Counter;
  CounterLoadedState({required this.Counter});



   @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterErrorState extends CounterState{

   String ErrorMsg = "Error";

  CounterErrorState({ required this.ErrorMsg});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

