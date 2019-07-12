import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectAnswerHandler;

  Answer(this.answerText, this.selectAnswerHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.deepOrange,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectAnswerHandler,
      ),
    );
  }
}
