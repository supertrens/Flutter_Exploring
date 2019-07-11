import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      "questionText": "What is your favorite color",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", "score": 5},
        {"text": "Lion", "score": 9},
      ]
    },
    {
      "questionText": "Who's your favorite person",
      "answers": [
        {"text": "Pitrens", "score": 1},
        {"text": "Ernst", "score": 1},
        {"text": "Muneco", "score": 1},
        {"text": "Peter", "score": 1},
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  void _restartQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Oiyster'),
          backgroundColor: Colors.orange,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions[_questionIndex], _answerQuestion)
            : Result(_totalScore , _restartQuiz),
      ),
    );
  }
}
