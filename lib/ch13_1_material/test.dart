import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: false,
        // primarySwatch: Colors.pink,
        // colorScheme: ColorScheme.light(primary: Colors.pink),
        // colorScheme: ColorScheme.dark(primary: Colors.pink),
        // useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Button')
              ),
              Checkbox(
                value: true,
                onChanged: (value) {}
              ),
              Text('Hello Flutter'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {}
        ),
      ),
    );
  }
}