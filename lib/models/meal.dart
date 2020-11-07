import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final num price;
  final String image;

   Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.price,
    @required this.image,
  });
}
