import 'package:flutter/material.dart';

import "/dummy_data.dart";
import '../itemsWidgets/categoryItemWidget.dart';

class CategoriesScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (BuildContext ctx, position) {
          final dummyCategory = DUMMY_CATEGORIES[position];
          return CategoryItemWidget(
            dummyCategory.id,
            dummyCategory.title,
            dummyCategory.color,
          );
        },
      );
  }
}
