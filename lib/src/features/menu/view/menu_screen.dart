import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/product_card.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/product_grid.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:coffe_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../modeles/product_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<CategoryModel> categories = [
    CategoryModel(title: 'Черный Кофе', drinksList: [
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
    ]),
    CategoryModel(title: 'Зеленый Чай', drinksList: [
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
    ]),
    CategoryModel(title: 'Синий Пуэр', drinksList: [
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
    ]),
    CategoryModel(title: 'Оранжевый Улун', drinksList: [
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
      ProductModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
    ]),
  ];

  final itemMenuScrollController = ItemScrollController();
  final itemAppbarScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  late int selectedCategoryIndex;

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(_onChageVisibility);
    selectedCategoryIndex = 0;
  }

  _onChageVisibility() {
    final indices = itemPositionsListener.itemPositions.value
        .map((item) => item.index)
        .toList();

    if (selectedCategoryIndex != indices[0]) {
      setState(() {
        selectedCategoryIndex = indices[0];
      });
      itemAppbarScrollController.scrollTo(
        index: selectedCategoryIndex,
        alignment: 0.1,
        duration: const Duration(milliseconds: 450),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: 100,
          child: CategoriesAppBar(
            appBarItemScrollController: itemAppbarScrollController,
            menuItemScrollController: itemMenuScrollController,
            selectedCategoryIndex: selectedCategoryIndex,
            model: categories,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ScrollablePositionedList.builder(
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemMenuScrollController,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ProdustGrid(model: categories[index]);
          },
        ),
      ),
    );
  }
}
