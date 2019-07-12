import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String cardTitle;

  MyCard(this.cardTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.white12,
        child: Container(
          child: Text(cardTitle),
        ),
        elevation: 10,
      ),
    );
  }
}
