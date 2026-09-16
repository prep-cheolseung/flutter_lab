import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {
  int no;

  CounterEvent(this.no);
}

class IncrementEvent extends CounterEvent {
  IncrementEvent(int no) : super(no);
}

class DecrementEvent extends CounterEvent {
  DecrementEvent(int no) : super(no);
}

class BlocCounter extends Bloc<CounterEvent, int> {
  BlocCounter() : super(0) {
    // on<IncrementEvent>((event, emit) => emit(state + event.no));
    on<IncrementEvent>((event, emit) {
      emit(state + event.no);
    });
    // on<DecrementEvent>((event, emit) => emit(state - event.no));
    on<DecrementEvent>((event, emit) {
      emit(state - event.no);
    });
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print('Transition... $transition');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: BlocProvider(
          create: (context) => BlocCounter(),
          child: MyWidget()
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);
    return BlocBuilder<BlocCounter, int>(
      builder: (context, count) {
        return Container(
          color: Colors.deepOrange,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${counterBloc.state}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(IncrementEvent(2));
                  },
                  child: Text('Increment')
                ),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(DecrementEvent(2));
                  },
                  child: Text('Decrement')
                )
              ],
            ),
          ),
        );
      }
    );
  }
}