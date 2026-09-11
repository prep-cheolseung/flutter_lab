import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _isDeepLink = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Test',
      home: Navigator(pages: [
        MaterialPage(child: OneScreen()),
        if (_isDeepLink) MaterialPage(child: TwoScreen())
      ], onPopPage: (route, result) => route.didPop(result)),
    );
  }
}

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('One Screen'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'One Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Screen'),
      ),
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Two Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Pop')
              )
            ],
          ),
        ),
      ),
    );
  }
}