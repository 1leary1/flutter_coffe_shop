import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/drink_card.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:coffe_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';

import '../modeles/drink_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<CategoryModel> categories = [
    CategoryModel(
        horizonalKey: GlobalKey(),
        verticalKey: GlobalKey(),
        title: 'Черный Кофе',
        drinksList: [
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
        ]),
    CategoryModel(
        horizonalKey: GlobalKey(),
        verticalKey: GlobalKey(),
        title: 'Зеленый Чай',
        drinksList: [
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
        ]),
    CategoryModel(
        horizonalKey: GlobalKey(),
        verticalKey: GlobalKey(),
        title: 'Синий Пуэр',
        drinksList: [
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
        ]),
    CategoryModel(
        horizonalKey: GlobalKey(),
        verticalKey: GlobalKey(),
        title: 'Оранжевый Улун',
        drinksList: [
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
        ]),
  ];

  List<Widget> _getSliverWidgets() {
    List<Widget> slivers = [];
    for (int i = 0; i < categories.length; i++) {
      slivers.add(SliverAppBar(
        key: categories[i].verticalKey,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          categories[i].title ?? 'Loading',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ));
      slivers.add(SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return DrinkCard(
              model: categories[i].drinksList[index],
            );
          },
          childCount: categories[i].drinksList.length,
        ),
      ));
    }
    return slivers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        title: SizedBox(height: 100, child: Categories(model: categories)),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: _getSliverWidgets(),
        ),
      ),
    );
  }
}
