import 'package:flutter/material.dart';

class FourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Four Screen'),
        ),
        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Four Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Pop'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}