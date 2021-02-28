import 'package:flutter/material.dart';

import 'widgets/screenWidgets/filtersScreenWidget.dart';
import './widgets/screenWidgets/categoryMealScreenWidget.dart';
import './widgets/screenWidgets/mealDetailScreenWidget.dart';
import './widgets/screenWidgets/tabsScreenWidget.dart';
import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/models/mealModel.dart';
import './utils/consts.dart';

/*
        Created by Juan Nicolás Vargas 27/02/2021
*/
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<MealModel> _avaliableMeals = DUMMY_MEALS;
  List<MealModel> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaliableMeals = DUMMY_MEALS.where((element) {
        if (_filters["gluten"] && !element.isGlutenFree) {
          return false;
        } else if (_filters["lactose"] && !element.isLactoseFree) {
          return false;
        } else if (_filters["vegan"] && !element.isVegan) {
          return false;
        } else if (_filters["vegetarian"] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(MealModel mealObject) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element == mealObject);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(mealObject);
      });
    }
  }

  bool _isFavorite(MealModel mealObject){
    return _favoriteMeals.any((element) => element == mealObject);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.white70,
        canvasColor: Color.fromRGBO(235, 234, 220, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: Consts.mainPage,
      routes: {
        Consts.mainPage: (ctx) => TabsScreenWidget(_favoriteMeals),
        Consts.categoryMealsScreen: (ctx) =>
            CategoryMealsScreenWidget(_avaliableMeals),
        Consts.mealDetailScreen: (ctx) => MealDetailScreenWidget(_toggleFavorite, _isFavorite),
        Consts.filtersScreen: (ctx) =>
            FiltersScreenWidget(_setFilters, _filters)
      },
      onGenerateRoute: (settings) {
        // print(settings.arguments);
        // return MaterialPageRoute(
        //   builder: (ctx) => TabsScreenWidget(),
        // );
      },
      onUnknownRoute: (settings) {
        // print(settings.arguments);
        // return MaterialPageRoute(
        //   builder: (ctx) => TabsScreenWidget(),
        // );
      },
    );
  }
}
