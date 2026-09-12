import 'dart:convert';
import 'package:flutter/material.dart';

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

class Todo {
  int id;
  String title;
  bool completed;

  Todo(this.id, this.title, this.completed);

  Todo.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      completed = json['completed'];

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'completed': completed};
}

class MyAppState extends State<MyApp> {
  String jsonStr = '{"id": 1, "title": "HELLO", "completed": false}';
  Todo? todo;
  String result = '';

  onPressDecode() {
    Map<String, dynamic> map = jsonDecode(jsonStr);
    todo = Todo.fromJson(map);
    setState(() {
      result = "Decode : id: ${todo?.id}, title: ${todo?.title}, completed: ${todo?.completed}";
    });
  }

  onPressEncode() {
    setState(() {
      result = "Encode : ${jsonEncode(todo)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$result'),
              ElevatedButton(
                child: Text('Decode'),
                onPressed: onPressDecode
              ),
              ElevatedButton(
                child: Text('Encode'),
                onPressed: onPressEncode
              )
            ],
          ),
        ),
      ),
    );
  }
}