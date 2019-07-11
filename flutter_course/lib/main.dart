import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionindex = 0;

  final questions = [
    "What's your favorite color?",
    "What's your favorite animal"
  ];

  void answerQuestion() {
    setState(() {
      questionindex++;
    });
    print('I am pressed ' + questionindex.toString());
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
            Text(questions[questionindex]),
            RaisedButton(
              child: Text('Blue'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Red'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Yellow'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
