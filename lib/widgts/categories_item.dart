import 'package:flutter/material.dart';
import 'package:shops/data/data.dart';
import 'package:shops/screens/categories_in_screens.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoriesItem({
    this.title,
    this.color,
    this.id,
  });
  void selectItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesInScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
    print(DUMMY_MEALS[0]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(35),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image(
            image: AssetImage(title),
            fit: BoxFit.cover,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
