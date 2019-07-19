import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";

  final Function toggleFavoriteHandler;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavoriteHandler, this.isMealFavorite);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArguments['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(context, buildIngredientList(selectedMeal, context)),
            buildSectionTitle(context, "Steps"),
            buildContainer(context, buildStepList(selectedMeal, context)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(id) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavoriteHandler(id);
        },
      ),
    );
  }

  ListView buildIngredientList(Meal selectedMeal, BuildContext context) {
    return ListView.builder(
      itemCount: selectedMeal.ingredients.length,
      itemBuilder: (ctx, index) => Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(selectedMeal.ingredients[index]),
        ),
      ),
    );
  }

  ListView buildStepList(Meal selectedMeal, BuildContext context) {
    return ListView.builder(
      itemCount: selectedMeal.steps.length,
      itemBuilder: (ctx, index) => Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text("#${(index + 1)}"),
            ),
            title: Text(selectedMeal.steps[index]),
          ),
          Divider(),
        ],
      ),
    );
  }

  Container buildContainer(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
