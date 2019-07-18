import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../screens/favorites.dart';
import '../screens/categories.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  static const String CATEGORY_TITlE = "Categories";
  static const String FAVORITES_TITlE = " Your Favorites";

  final List<Map<String, Object>> _pages = [
    {"page": CategoriesScreen(), "title": CATEGORY_TITlE},
    {"page": FavoritesScreen(), "title": FAVORITES_TITlE},
  ];

  int _selectedPageIndex = 0;

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
      drawer:MainDrawer(),
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
