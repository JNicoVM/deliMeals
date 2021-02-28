import 'package:flutter/material.dart';

import './widgets/screenWidgets/categoryMealScreenWidget.dart';
import './widgets/screenWidgets/categoriesScreenWidget.dart';
import './widgets/screenWidgets/mealDetailScreenWidget.dart';
import './utils/consts.dart';

/*
        Created by Juan Nicolás Vargas 27/02/2021
*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.amberAccent,
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
        Consts.mainPage: (ctx) => CategoriesScreen(),
        Consts.categoryMealsScreen: (ctx) => CategoryMealsScreenWidget(),
        Consts.mealDetailScreen: (ctx) => MealDetailScren()
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
