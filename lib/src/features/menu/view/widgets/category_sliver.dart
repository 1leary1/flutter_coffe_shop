import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:flutter/material.dart';

class CategorySliver extends StatelessWidget {
  final CategoryModel? model;
  const CategorySliver({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(model?.title ?? 'Loading'),
    );
  }
}
