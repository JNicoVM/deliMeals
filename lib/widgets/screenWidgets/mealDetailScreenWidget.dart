import 'package:delimeals/models/mealModel.dart';
import 'package:flutter/material.dart';

class MealDetailScreenWidget extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavortite;

  MealDetailScreenWidget(this.toggleFavorite, this.isFavortite);

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContaioner(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealObject = ModalRoute.of(context).settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealObject.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealObject.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContaioner(
              ListView.builder(
                itemBuilder: (BuildContext context, position) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        mealObject.ingredients[position],
                      ),
                    ),
                  );
                },
                itemCount: mealObject.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContaioner(
              ListView.builder(
                itemBuilder: (BuildContext context, position) {
                  final step = mealObject.steps[position];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${(position + 1)}"),
                        ),
                        title: Text(
                          step,
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: mealObject.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavortite(mealObject) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealObject),
      ),
    );
  }
}
