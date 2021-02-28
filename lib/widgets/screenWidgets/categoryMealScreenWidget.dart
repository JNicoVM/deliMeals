import 'package:flutter/material.dart';


import '/widgets/itemsWidgets/mealItemWidget.dart';
import '/models/mealModel.dart';

class CategoryMealsScreenWidget extends StatefulWidget {
  final List<MealModel> avaliableMeals;

  CategoryMealsScreenWidget(this.avaliableMeals);
  // final String _categoryID;
  // final String _categoryTitle;

  // CategoryMealsScreenWidget(this._categoryID, this._categoryTitle);

  @override
  _CategoryMealsScreenWidgetState createState() =>
      _CategoryMealsScreenWidgetState();
}

class _CategoryMealsScreenWidgetState extends State<CategoryMealsScreenWidget> {
  String _categoryTitle;
  List<MealModel> _displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final _routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryTitle = _routeArg["title"];
      final _categoryId = _routeArg["id"];
      _displayedMeals = widget.avaliableMeals
          .where((meal) => meal.categories.contains(_categoryId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(MealModel mealObject) {
    setState(() {
      _displayedMeals.removeWhere((element) => element == mealObject);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, position) {
          return MealItemWidget(
            mealObject: _displayedMeals[position],
            // removeItem: _removeMeal,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
