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
        body: TestScreen()
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {
  bool? isChecked = true;
  String? selectPlatform;
  double sliderValue = 5.0;
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text('Checkbox Test'),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              }
            ),
            Text('Checkbox value is $isChecked')
          ],
        ),
        Text('Radio Test'),
        Row(
          children: [
            Radio(
              value: "Andriod",
              groupValue: selectPlatform,
              onChanged: (String? value) {
                setState(() {
                  selectPlatform = value;
                });
              },
            ),
            Text('Android')
          ],
        ),
        Row(
          children: [
            Radio(
              value: "IOS",
              groupValue: selectPlatform,
              onChanged: (String? value) {
                setState(() {
                  selectPlatform = value;
                });
              },
            ),
            Text('IOS')
          ],
        ),
        Text('Select platform is $selectPlatform'),
        Text('Slider Test'),
        Slider(
          min: 0,
          max: 10,
          value: sliderValue,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
            });
          }
        ),
        Text('Slider value is $sliderValue'),
        Text('Switch Test'),
        Switch(
          value: switchValue,
          onChanged: (bool value) {
            setState(() {
              switchValue = value;
            });
          }
        ),
        Text('Select value is $switchValue')
      ],
    );
  }
}