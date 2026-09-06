import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Provides rootBundle for asset usage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Function that reads and returns an asset file using rootBundle
  // Future means asynchronous data
  Future<String> useRootBundle() async {
    return await rootBundle.loadString('assets/text/my_text.txt');
  }

  // Function that reads and returns an asset file using DefaultAssetBundled
  Future<String> useDefaultAssetBundle(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/text/my_text.txt');
  }

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
            Image.asset('images/icon.jpg'),
            Image.asset('images/icon/user.png'),
            // FutureBuilder is a widget that constructs a screen using asynchronous data
            FutureBuilder(
              // Call the useRootBundle() function
              future: useRootBundle(),
              // The result of the useRootBundle() function is passed to the snapshot,
              // and the screen layout is constructed using this value
              builder: (context, snapshot) {
                return Text('RootBundle : ${snapshot.data}');
              }
            ),
            FutureBuilder(
              future: useDefaultAssetBundle(context),
              builder: (context, snapshot) {
                return Text('DefaultAssetBundle : ${snapshot.data}');
              }
            )
          ],
        ),
      ),
    );
  }
}