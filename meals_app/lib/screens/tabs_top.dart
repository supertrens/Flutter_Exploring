import 'package:flutter/material.dart';

import '../screens/favorites.dart';
import '../screens/categories.dart';

class TabsScreenTop extends StatefulWidget {
  @override
  _TabsScreenTopState createState() => _TabsScreenTopState();
}

class _TabsScreenTopState extends State<TabsScreenTop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.stars),
                text: 'Favorites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen([]),
          ],
        ),
      ),
    );
  }
}
