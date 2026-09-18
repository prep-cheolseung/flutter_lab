import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Channel',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: NativeCallWidget(),
    );
  }
}

class NativeCallWidget extends StatefulWidget {
  @override
  NativeCallWidgetState createState() => NativeCallWidgetState();
}

class NativeCallWidgetState extends State<NativeCallWidget> {
  String? resultMessage;
  String? receiveMessage;

  Future<Null> nativeCall() async {
    const channel = BasicMessageChannel<String>('myMessageChannel', StringCodec());
    String? result = await channel.send('Hello from Dart');
    setState(() {
      resultMessage = result;
    });
    channel.setMessageHandler((String? message) async {
      setState(() {
        receiveMessage = message;
      });
      return 'Reply from Dart';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Channel"),
      ),
      body:  Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('resultMessage : $resultMessage'),
              Text('receiveMessage : $receiveMessage'),
              ElevatedButton(
                onPressed: () {
                  nativeCall();
                },
                child: Text('Native call')
              )
            ],
          ),
        ),
      ),
    );
  }
}