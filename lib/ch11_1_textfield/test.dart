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
  final controller = TextEditingController();
  int textCounter = 0;

  _printValue() {
    print("_printValue() : ${controller.text}");
    setState(() {
      textCounter = controller.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_printValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("Build...");
    return Column(
      children: [
        Text('TextField Text'),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            counterText: "$textCounter Characters",
            helperText: "Please enter data.",
            hintText: "Hint Text",
            labelText: 'Data',
            prefixIcon: Icon(Icons.input),
          ),
          keyboardType: TextInputType.emailAddress,
          minLines: 1,
          maxLines: 5,
          style: TextStyle(fontSize: 15),
          textInputAction: TextInputAction.search,
        )
      ],
    );
  }
}