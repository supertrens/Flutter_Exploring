import 'package:flutter/material.dart';

import './screens/filters.dart';
import './screens/tabs.dart';
import './screens/meal_details.dart';
import './screens/category_meals.dart';
import './screens/categories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      home: Scaffold(
        body: TabsScreen(),
      ),
      routes: {
        // "/":(ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
      onUnknownRoute: (settings) {
        //404 page
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
