import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String longTxt =
    '동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. ' 
    '무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세.';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello Flutter',
              style: TextStyle(
                backgroundColor: Colors.yellow,
                color: Colors.red,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              longTxt,
              style: TextStyle(
                fontSize: 20
              ),
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
            RichText(
              text: TextSpan(
                text: 'HE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: 'L',
                    style: TextStyle(
                      fontStyle: FontStyle.italic
                    ),
                    children: [
                      TextSpan(text: 'LO '),
                      TextSpan(
                        text: 'FLU',
                        style: TextStyle(
                          color: Colors.red
                        )
                      )
                    ]
                  ),
                  TextSpan(
                    text: 'TTER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold)
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}