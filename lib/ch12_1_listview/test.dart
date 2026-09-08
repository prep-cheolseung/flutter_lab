import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;
  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  List<User> users = [
    User('이철승', '0100001', 'a@a.com'), User('김철승', '0100002', 'b@b.com'),
    User('박철승', '0100003', 'c@c.com'), User('최철승', '0100004', 'd@d.com'),
    User('정철승', '0100005', 'e@e.com'), User('강철승', '0100006', 'f@f.com'),
    User('조철승', '0100007', 'g@g.com'), User('윤철승', '0100008', 'h@h.com'),
    User('장철승', '0100009', 'i@i.com'), User('임철승', '0100010', 'j@j.com'),
    User('한철승', '0100011', 'k@k.com'), User('오철승', '0100012', 'l@l.com'),
    User('서철승', '0100013', 'm@m.com'), User('신철승', '0100014', 'n@n.com'),
    User('권철승', '0100015', 'o@o.com'), User('황철승', '0100016', 'p@p.com'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/big.jpeg'),
              ),
              title: Text(users[index].name),
              subtitle: Text(users[index].phone),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                print(users[index].name);
              },
            );
          },
          itemCount: users.length,
          separatorBuilder: (context, index) {
            return Divider(
              height: 2,
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}