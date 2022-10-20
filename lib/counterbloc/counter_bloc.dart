import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:counter_app/counterbloc/counter_events.dart';

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    on<IncrementCounterEvent>((event, emit) => {emit(state + 1)});
    on<DecrementCounterEvent>((event, emit) => {
          if (state != 0) {emit(state - 1)}
        });
    on<RestartCounterEvent>((event, emit) => emit(0));
    on<inputCounterEvent>((event, emit) => {emit(event.input)});
  }
}
