import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      "text": "What's your favorite color?",
      "answers": [
        "Black",
        "Green",
        "White",
        "Redhh"
      ]
    },
    {
      "text": "What's your favorite Animal?",
      "answers": ["Rabit", "Snake", "Lion", "Elephant"]
    },
    {
      "text": "What's your favorite Drink?",
      "answers": ["Coke Cola", "Papaya", "Green Tea", "Water"]
    },
  ];

  void restartQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  void answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Regetting started"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions[_questionIndex], answerQuestion)
            : Result(restartQuiz),
      ),
    );
  }
}
