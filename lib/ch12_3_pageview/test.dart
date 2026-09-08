import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PageController controller = PageController(initialPage: 1, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: PageView(
          controller: controller,
          children: [
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Page One',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Page Two',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Page Three',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}