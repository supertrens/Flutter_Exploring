import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final  questions;
  final Function answerHandler;

  Quiz(this.questions, this.answerHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions['questionText']),
        ...(questions['answers']as List<Map<String , Object>>)
            .map((answer) {
          return Answer(answer['text'], () => answerHandler(answer['score']));
        }).toList(),
      ],
    );
  }
}
