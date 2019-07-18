import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";

  // var ingredients = DUMMY_MEALS.where((meal) {
  //   return meal.id == id;
  // }).toString();

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArguments['id'];
    return Scaffold(
        appBar: AppBar(
          title: Text(id),
        ),
        body: Center(
          child: Text("yea"),
        ));
  }
}
