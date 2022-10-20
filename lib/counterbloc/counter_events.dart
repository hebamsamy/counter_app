abstract class CounterEvents {
  const CounterEvents();
}

class IncrementCounterEvent extends CounterEvents {}

class DecrementCounterEvent extends CounterEvents {}

class RestartCounterEvent extends CounterEvents {}

class inputCounterEvent extends CounterEvents {
  int input;
  inputCounterEvent({required this.input});
}
