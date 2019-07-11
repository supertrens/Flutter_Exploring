import 'package:flutter/material.dart';

import './question.dart';
import './option.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionindex = 0;

  final _questions = [
    "EVENT",
    "PROXIMITY"
  ];

  void _answerQuestion() {
    setState(() {
      _questionindex++;
    });
    print('I am pressed ' + _questionindex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Oiyster'),
        ),
        body: Column(
          children: [
            Question(_questions[_questionindex]),
            Option('Red', _answerQuestion),
            Option('Blue', _answerQuestion),
            Option('Yellow', _answerQuestion),
          ],
        ),
      ),
    );
  }
}
