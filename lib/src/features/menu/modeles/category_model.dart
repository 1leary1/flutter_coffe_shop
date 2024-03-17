import 'package:flutter/material.dart';

import 'product_model.dart';

class CategoryModel {
  final String title;
  final List<ProductModel> drinksList;

  CategoryModel({
    required this.title,
    required this.drinksList,
  });
}
