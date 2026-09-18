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
    const channel = const MethodChannel('myMethodChannel');

    try {
      var details = {'Username': 'Lee', 'Password': '0123456789'};
      final Map result = await channel.invokeMethod("oneMethod", details);
      setState(() {
        resultMessage = "${result["one"]}, ${result["two"]}";
      });
      channel.setMethodCallHandler((call) async {
        switch (call.method) {
          case 'twoMethod':
            setState(() {
              receiveMessage = "Receive : ${call.arguments}";
            });
            return 'Reply from Dart';
        }
      });
    } on PlatformException catch (e) {
      print("Failed : '${e.message}");
    }
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
              Text(
                'resultMessage : $resultMessage',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'receiveMessage : $receiveMessage',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
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