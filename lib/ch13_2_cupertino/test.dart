import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget platformUI() {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
          brightness: Brightness.light
        ),
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Cupertino Title'),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                child: Text('Click'),
                onPressed: () {}
              ),
              Center(
                child: Text('Hello Flutter'),
              )
            ],
          )
        ),
      );
    } else if (Platform.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material Title'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Click'),
                onPressed: () {}
              ),
              Center(
                child: Text('Hello Flutter'),
              )
            ],
          )
        ),
      );
    } else {
      return Text(
        'Unknown Device',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return platformUI();
  }
}