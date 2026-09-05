import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyListWidget()
    );
  }
}

class MyListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyListWidgetState();
  }
}

class _MyListWidgetState extends State<MyListWidget> {
  List<Widget> widgetList = [
    MyColorItemWidget(Colors.red, key: UniqueKey(),),
    MyColorItemWidget(Colors.blue, key: UniqueKey(),),
  ];

  onChange() {
    print(widgetList.elementAt(0).key);
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Key Test'),),
      body: Column(
        children: [
          Row(children: widgetList,),
          ElevatedButton(
            onPressed: onChange,
            child: Text("Toggle")
          )
        ],
      ),
    );
  }
}

class MyColorItemWidget extends StatefulWidget {
  Color color;
  MyColorItemWidget(this.color, {Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyColorItemWidgetState(color);
  }
}

class _MyColorItemWidgetState extends State<MyColorItemWidget> {
  Color color;
  _MyColorItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      )
    );
  }
}