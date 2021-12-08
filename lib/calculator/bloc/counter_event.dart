part of 'counter_bloc.dart';

/// The events which `CounterBloc` will react to.
abstract class CounterEvent {}

/// Notifies bloc to increment state.
class Increment extends CounterEvent {

}
class decrement extends CounterEvent {

}
/// A `CounterBloc` which handles converting `CounterEvent`s into `int`s.
