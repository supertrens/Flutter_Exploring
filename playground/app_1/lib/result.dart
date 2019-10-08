import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function restartQuizHandler;
  Result(this.restartQuizHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text("Yea we made it"),
        ),
        RaisedButton(
          onPressed: restartQuizHandler,
          child: Text("Restart"),
        )
      ],
    );
  }
}
