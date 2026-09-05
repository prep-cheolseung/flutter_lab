import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool enabled = false;
  String stateText = "Disable";

  void changeCheck() {
    if (enabled) {
      stateText = "Disable";
      enabled = false;
    } else {
      stateText = "Enable";
      enabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless Test'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: changeCheck,
                icon: (
                  enabled ?
                  Icon(Icons.check_box, size: 20,) :
                  Icon(Icons.check_box_outline_blank, size: 20,)
                ),
                color: Colors.red,
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Text('$stateText',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}