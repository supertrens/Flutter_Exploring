import 'package:flutter/material.dart';

class MealItemExtraData extends StatelessWidget {
  final String title;
  final IconData icon;

  MealItemExtraData(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(title),
      ],
    );
  }
}
