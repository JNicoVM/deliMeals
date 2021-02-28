import 'package:delimeals/models/mealModel.dart';
import 'package:delimeals/widgets/itemsWidgets/mealItemWidget.dart';
import 'package:flutter/material.dart';

class FavoritesScreenWidget extends StatelessWidget {
  final List<MealModel> favoriteMeals;

  FavoritesScreenWidget(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet -start adding some!"),
      );
    }else{
      return ListView.builder(
        itemBuilder: (BuildContext context, position) {
          return MealItemWidget(
            mealObject: favoriteMeals[position],
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
