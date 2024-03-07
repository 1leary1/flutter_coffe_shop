import 'package:flutter/material.dart';

import 'drink_model.dart';

class CategoryModel {
  final GlobalKey horizonalKey;
  final GlobalKey verticalKey;
  final String title;
  final List<DrinkModel> drinksList;

  CategoryModel({
    required this.horizonalKey,
    required this.verticalKey,
    required this.title,
    required this.drinksList,
  });
}
