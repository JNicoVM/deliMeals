import 'package:flutter/material.dart';

import '/dummy_data.dart';
import '/widgets/itemsWidgets/mealItemWidget.dart';

class CategoryMealsScreenWidget extends StatelessWidget {
  // final String _categoryID;
  // final String _categoryTitle;

  // CategoryMealsScreenWidget(this._categoryID, this._categoryTitle);

  @override
  Widget build(BuildContext context) {
    final _routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final _categoryTitle = _routeArg["title"];
    final _categoryId = _routeArg["id"];
    final _categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(_categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, position) {
          return MealItemWidget(
            mealObject: _categoryMeals[position],
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
