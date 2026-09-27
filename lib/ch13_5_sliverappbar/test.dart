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
                onPressed: () {},
                icon: Icon(Icons.expand)
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
                    image: AssetImage('images/big.jpeg'),
                    fit: BoxFit.fill
                  )
                )
              ),
              title: Text('AppBar Title'),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_alert)
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone)
                )
              ]
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Hello Flutter Item $index')
                  );
                }
              )
            )
          ]
        )
      )
    );
  }
}