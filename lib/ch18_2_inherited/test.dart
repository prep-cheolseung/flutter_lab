import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
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
        body: MyInheritedWidget(TestWidget()),
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  int count = 0; // Child shared data

  MyInheritedWidget(child) : super(child: child);

  // Function to be called from below
  increment() {
    count++;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MyInheritedWidget? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
}

class TestSubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int count = MyInheritedWidget.of(context)!.count;
    return Container(
      width: 200,
      height: 200,
      color: Colors.yellow,
      child: Center(
        child: Text(
          'SubWidget : $count',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

// Sub-widget of MyInheritedWidget
class TestWidget extends StatelessWidget {
  TestWidget() {
    print('Test-widget constructor...');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        MyInheritedWidget? widget = MyInheritedWidget.of(context);
        int counter = MyInheritedWidget.of(context)!.count;
        Function increment = MyInheritedWidget.of(context)!.increment;
        return Center(
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'TestWidget : $counter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton(
                  // onPressed: () => setState(() => increment()),
                  onPressed: () {
                    setState(() => increment());
                  },
                  child: Text('Increment()')
                ),
                ElevatedButton(
                  // onPressed: () => setState(() => widget!.count++),
                  onPressed: () {
                    setState(() => widget!.count++);
                  },
                  child: Text('Count++')
                ),
                TestSubWidget()
              ],
            ),
          ),
        );
      }
    );
  }
}