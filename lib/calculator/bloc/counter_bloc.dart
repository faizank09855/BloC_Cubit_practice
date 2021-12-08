import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// The initial state of the `CounterBloc` is 0.
  CounterBloc() : super(CounterState(a: 0)) {
    /// When an `Increment` event is added,
    /// the current `state` of the bloc is accessed via the `state` property
    /// and a new state is emitted via `emit`.
    on<Increment>((event, emit) => emit(CounterState(a: state.a + 1)));

    on<decrement>((event , emit)=> emit(CounterState(a: state.a - 1)));
  }
}