import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/main_drawer.dart';
import '../screens/favorites.dart';
import '../screens/categories.dart';

class TabsScreen extends StatefulWidget {
  final favoriteMealHandler;

  TabsScreen(this.favoriteMealHandler);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  static const String CATEGORY_TITlE = "Categories";
  static const String FAVORITES_TITlE = " Your Favorites";
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": CATEGORY_TITlE},
      {
        "page": FavoritesScreen(widget.favoriteMealHandler ),
        "title": FAVORITES_TITlE
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
