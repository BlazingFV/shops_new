import 'package:flutter/material.dart';
import 'package:shops/models/category.dart';
import 'package:shops/models/meal.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'Sweets',
    title: 'assets/images/sweets.png',
    color: Colors.purple,
  ),
  Category(
    id: 'Pastries',
    title: 'assets/images/pastries.png',
    color: Colors.red,
  ),
  Category(
    id: 'Dates',
    title: 'assets/images/dates.png',
    color: Colors.orange,
  ),
  Category(
    id: 'Wedding',
    title: 'assets/images/wedding.png',
    color: Colors.amber,
  ),
  Category(
    id: 'Kosha',
    title: 'assets/images/kosha.png',
    color: Colors.blue,
  ),
  Category(
    id: 'Party',
    title: 'assets/images/party_planners.png',
    color: Colors.green,
  ),
  Category(
    id: 'Food',
    title: 'assets/images/food.png',
    color: Colors.lightBlue,
  ),
];

 var DUMMY_MEALS =  [
  Meal(
    id: 'm1',
    categories: [
      'Sweets',
      'Pastries'
    ],
    title: 'Sweets and Cakes',
    price: 0,
    image: 'assets/images/sweets.png',
  ),
   Meal(
    id: 'm1',
    categories: [
      'Pastries',
      'Sweets'
    ],
    title: 'Sweets and Cakes',
    price: 0,
    image: 'assets/images/sweets.png',
    
  ),
  Meal(
    id: 'm1',
    categories: [
      'Dates',
    ],
    title: 'Sweets and Cakes',
    price: 0,
    image: 'assets/images/sweets.png',
  ),
];
