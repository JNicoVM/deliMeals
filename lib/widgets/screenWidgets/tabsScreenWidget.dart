import 'package:delimeals/models/mealModel.dart';
import 'package:delimeals/widgets/drawersWidgets/mainDrawerWidget.dart';
import 'package:delimeals/widgets/screenWidgets/favoritesScreenWidget.dart';
import 'package:flutter/material.dart';

import './categoriesScreenWidget.dart';

class TabsScreenWidget extends StatefulWidget {

  final List<MealModel> favoriteMeals;

  TabsScreenWidget(this.favoriteMeals);

  @override
  _TabsScreenWidgetState createState() => _TabsScreenWidgetState();
}

class _TabsScreenWidgetState extends State<TabsScreenWidget> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
   _pages = [
    {
      "page": CategoriesScreenWidget(),
      "title": "Categories",
    },
    {
      "page": FavoritesScreenWidget(widget.favoriteMeals),
      "title": "Your Favorites",
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
        title: Text(
          _pages[_selectedPageIndex]["title"],
        ),
        // automaticallyImplyLeading: false,
      ),
      drawer: MAinDrawerWidget(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.greenAccent,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}

// bottom: TabBar(
//           tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: "Categories",
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: "Favorites",
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         children: [
//           CategoriesScreenWidget(),
//           FavoritesScreenWidget(),
//         ],
//       ),
