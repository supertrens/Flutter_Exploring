import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId;
  String categorytitle;
  Color categoryColor;
  List<Meal> categoryMeals;
  bool _loadingInitData = false;

  void _removedMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadingInitData) {
      // to avoid multiple initiation
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;

      categoryId = routesArgs['id'];
      categorytitle = routesArgs['title'];
      categoryColor = routesArgs['color'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadingInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
