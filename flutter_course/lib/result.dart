import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function restartQuizHandler;

  Result(this.totalScore, this.restartQuizHandler);

  String get resultPhrase {
    String resultText;

    if(totalScore <= 8){
      resultText = 'You are awesome and innocent!';
    } else if(totalScore <= 12){
      resultText = "Pretty likeable";
    } else if(totalScore <= 16){
      resultText = "You are .. strange";
    } else {
      resultText = "You are a monster";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:<Widget>[
         Text(
          resultPhrase,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 34, 
            fontWeight: FontWeight.bold
            ),
          ),
          FlatButton(
            textColor: Colors.orange,
            child: Text('Restart Quiz') ,
            onPressed: restartQuizHandler,
          )
        ],
      ),
    );
  }
}
