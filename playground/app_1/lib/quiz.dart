import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final quetions;
  final Function answerQuestionHandler;

  Quiz(this.quetions, this.answerQuestionHandler);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(quetions['text']),
      ...(quetions['answers'] as List<String>)
          .map((currentOption) {
        return Answer(answerQuestionHandler, currentOption);
      }).toList()
    ]);
  }
}
