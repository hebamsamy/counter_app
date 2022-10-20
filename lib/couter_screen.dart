import 'package:counter_app/counterbloc/counter_bloc.dart';
import 'package:counter_app/counterbloc/counter_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: BlocConsumer<CounterBloc, int>(
        listener: (BuildContext context, state) => null,
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("My Counter"), actions: [
              IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(RestartCounterEvent());
                  },
                  icon: Icon(Icons.replay))
            ]),
            body: Column(children: [
              TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  int val = int.parse(value);
                  context
                      .read<CounterBloc>()
                      .add(inputCounterEvent(input: val));
                },
              ),
              Text(
                state.toString(),
                style: TextStyle(fontSize: 40),
              ),
            ]),
            floatingActionButton:
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounterEvent());
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounterEvent());
                },
                child: Icon(Icons.remove),
              )
            ]),
          );
        },
      ),
    );
  }
}
