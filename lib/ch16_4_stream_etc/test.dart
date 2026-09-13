import 'dart:async';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  subscriptionTest() {
    var stream = Stream.fromIterable([1, 2, 3]);
    StreamSubscription subscription = stream.listen(null);
    subscription.onData((data) {
      print('Value : $data');
    });
    subscription.onError((error) {
      print('Error : $error');
    });
    subscription.onDone(() {
      print('Stream done...');
    });
  }

  controllerTest() {
    var controller = StreamController();

    var stream1 = Stream.fromIterable([1, 2, 3]);
    var stream2 = Stream.fromIterable(['A', 'B', 'C']);

    stream1.listen((value) {
      controller.add(value);
    });
    stream2.listen((value) {
      controller.add(value);
    });
    
    controller.stream.listen((value) {
      print('$value');
    });
  }

  transformerTest() {
    var stream = Stream.fromIterable([1, 2, 3]);

    StreamTransformer<int, dynamic> transformer = StreamTransformer.fromHandlers(handleData: (value, sink) {
      print('In transformer... $value');
      sink.add(value * value);
    });

    stream.transform(transformer).listen((value) {
      print('In listen... $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: subscriptionTest,
                child: Text('Subscription')
              ),
              ElevatedButton(
                onPressed: controllerTest,
                child: Text('Controller')
              ),
              ElevatedButton(
                onPressed: transformerTest,
                child: Text('Transformer')
              )
            ],
          ),
        ),
      ),
    );
  }
}