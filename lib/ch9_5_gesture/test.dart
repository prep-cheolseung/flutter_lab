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
        body: Column(
          children: [
            GestureDetector(
              child: Image.asset('images/icon/user.png'),
              onTap: () {
                print('Image click...');
              },
              onVerticalDragStart: (DragStartDetails details) {
                print('Vertical drag start... Global position : ${details.globalPosition.dx}, ${details.globalPosition.dy}');
                print('Vertical drag start... Local position : ${details.localPosition.dx}, ${details.localPosition.dy}');
              }
            ),
            ElevatedButton(
              onPressed: () {
                print('ElevatedButton click...');
              },
              child: Text('Click Me'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.red)
              ),
            )
          ],
        ),
      ),
    );
  }
}