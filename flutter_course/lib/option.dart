import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String optionText;
  final Function answerQuestion;

  Option(this.optionText , this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(optionText),
      onPressed: answerQuestion,
    );
  }
}
