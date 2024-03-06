import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:flutter/material.dart';

import 'drink_card.dart';

class CategorySliver extends StatelessWidget {
  final CategoryModel? model;
  const CategorySliver({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return SliverAppBar(
                title: Text(model?.title ?? 'Loading'),
              );
            } else if (index == 1) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return DrinkCard(
                      model: model?.drinksList[index],
                    );
                  },
                  childCount: model?.drinksList.length,
                ),
              );
            }
          }),
    );
  }
}
