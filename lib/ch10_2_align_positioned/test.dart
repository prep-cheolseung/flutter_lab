import 'package:flutter/material.dart';

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
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Container(
                color: Colors.yellow,
                width: 150,
                height: 150,
              ),
            ),
            Align(
              alignment: FractionalOffset(1.0, 0.0),
              child: Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
              left: 40.0,
              top: 40.0,
              child: Container(
                color: Colors.pink,
                width: 150,
                height: 150,
              )
            )
          ],
        ),
      ),
    );
  }
}