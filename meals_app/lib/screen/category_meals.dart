import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  
  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: Text(routesArgs['title'].toString()),
        backgroundColor: routesArgs['color'],
      ),
      body: Center(
        child: Text("The recipes for the ${routesArgs['title']}"),
      ),
    );
  }
}
