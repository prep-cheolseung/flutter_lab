import 'package:flutter/material.dart';
import 'user.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  // TODO: implement build
    return MaterialApp(
      home: Scaffold(
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
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigator.pushNamed(context, '/two');
                    final result = await Navigator.pushNamed(
                      arguments: {
                        "arg1": 10,
                        "arg2": "Hello",
                        "arg3": User('Lee', 'Seoul')
                      },
                      context,
                      '/two',
                    );
                    print('Result: ${(result as User).name}, ${(result as User).address}');
                  },
                  child: Text('Go Two'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}