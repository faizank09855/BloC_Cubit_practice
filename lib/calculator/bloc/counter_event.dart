part of 'counter_bloc.dart';

/// The events which `CounterBloc` will react to.
abstract class CounterEvent extends Equatable{}

/// Notifies bloc to increment state.
class FetchCounterEvent extends CounterEvent{
  @override
  List<Object> get props => throw UnimplementedError();

}
/// A `CounterBloc` which handles converting `CounterEvent`s into `int`s.
