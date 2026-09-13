import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String result = '';

  onPressGet() async {
    Map<String, String> headers = {
      "content-type": "application/json",
      "accept": "application/json"
    };
    http.Response response = await http.get(
      Uri.parse('http://jsonplaceholder.typicode.com/posts/1'),
      headers: headers
    );
    if (response.statusCode == 200) {
      setState(() {
        result = response.body;
      });
    } else {
      print('Error.......');
    }
  }

  onPressPost() async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {'title': 'Hello', 'body': 'Flutter', 'userId': '1'}
      );
      print('Status Code : ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          result = response.body;
        });
      } else {
        print('Error.......');
      }
    } catch (e) {
      print('Error..... $e');
    }
  }

  onPressClient() async {
    var client = http.Client();
    try {
      http.Response response = await client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {'title': 'Hello', 'body': 'Flutter', 'userId': '1'}
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
        setState(() {
          result = response.body;
        });
      } else {
        print('Error.......');
      }
    } finally {
      client.close();
    }
  }

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$result'),
              ElevatedButton(
                child: Text('GET'),
                onPressed: onPressGet
              ),
              ElevatedButton(
                child: Text('POST'),
                onPressed: onPressPost
              ),
              ElevatedButton(
                child: Text('Client'),
                onPressed: onPressClient
              )
            ],
          ),
        ),
      ),
    );
  }
}