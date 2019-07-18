import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    
    final String categoryId = routesArgs['id'];
    final String categorytitle = routesArgs['title'];
    final Color categoryColor = routesArgs['color'];
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx , index) {
          return ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text(categoryMeals[index].title),
          );
        } , itemCount: categoryMeals.length,
      ),
    );
  }
}
