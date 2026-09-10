import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text(
      'First Screen',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      )
    ),
    Text(
      'Second Screen',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      )
    ),
    Text(
      'Third Screen',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      )
    ),
    Text(
      'Fourth Screen',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      )
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
              data: ThemeData.from(
              colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white)
              ),
              child: Container(
                alignment: Alignment.center,
                height: 48.0,
                child: Text('AppBar Bottom Text')
              ),
            ),
          ),
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
            )
          ],
        ),
        body:  Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.home),
              label: 'First',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.business),
              label: 'Second',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.home),
              label: 'Third',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.home),
              label: 'Fourth',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text('Item 1'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Item 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}