import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionindex = 0;

  void _answerQuestion() {
    setState(() {
      _questionindex++;
    });
    print('I am pressed ' + _questionindex.toString());
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        "questionText": "EVENT",
        "answers": ["Admin", "Email User", "Login User","guest user"]
      },
      {
        "questionText": "PROXIMITY",
        "answers": ["Taipei", "Tainan", "Kaoshiung"]
      },
      {
        "questionText": "GLOBAL",
        "answers": ["Taiwan", "Singapore", "Malasia"]
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Oiyster'),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Question(_questions[_questionindex]['questionText']),
            ...(_questions[_questionindex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answer, _answerQuestion);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
