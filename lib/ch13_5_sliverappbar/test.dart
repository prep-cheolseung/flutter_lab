import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.expand),
                onPressed: () {},
              ),
              backgroundColor: Colors.pink,
              elevation: 50,
              expandedHeight: 200,
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/big.jpeg')
                  )
                ),
              ),
              title: Text('AppBar Title'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_alert),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {},
                ),
              ],
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Hello Flutter Item $index'),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}