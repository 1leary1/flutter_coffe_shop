import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/services/scroll_services.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/drink_card.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:coffe_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
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
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
          DrinkModel(image: ImageSources.coffe, name: 'Кофе', price: 123),
        ]),
  ];

  late String visibleTitle;
  var visibility;
  late List<int> visibleCategoryIndexes;
  late int selectedCategory;

  @override
  void initState() {
    super.initState();
    visibleCategoryIndexes = [];
    selectedCategory = 0;
  }

  _onChangeTitleVisability(var visibilityInfo) {
    visibleTitle = visibilityInfo.key
        .toString()
        .replaceAll("[<'", "")
        .replaceAll("'>]", "");
  }

  _horizontalScroll(String visibleTitle, var visibilityInfo) {
    setState(() {
      var visiblePercentage = visibilityInfo.visibleFraction;

      for (int i = 0; i < categories.length; i++) {
        if (visibleTitle == categories[i].title && visiblePercentage == 1.0) {
          visibleCategoryIndexes.add(i);
        }

        if (visibleTitle == categories[i].title && visiblePercentage == 0.0) {
          visibleCategoryIndexes.remove(i);
        }

        visibleCategoryIndexes.length == 0
            ? 0
            : selectedCategory =
                visibleCategoryIndexes[visibleCategoryIndexes.length - 1];
        ScrollServices.scrollToItem(categories[selectedCategory].horizonalKey);
      }
    });
  }

  List<Widget> _getSliverWidgets(BuildContext context) {
    List<Widget> slivers = [];
    for (int i = 0; i < categories.length; i++) {
      slivers.add(SliverAppBar(
        key: categories[i].verticalKey,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        title: VisibilityDetector(
          key: Key(categories[i].title),
          onVisibilityChanged: (visibilityInfo) {
            VisibilityDetectorController.instance.updateInterval =
                Durations.short1;
            var visiblePercentage = visibilityInfo.visibleFraction;
            _onChangeTitleVisability(visibilityInfo);
            _horizontalScroll(visibleTitle, visibilityInfo);
          },
          child: Text(
            categories[i].title ?? 'Loading',
            style: Theme.of(context).textTheme.titleLarge,
          ),
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
        title: SizedBox(
          height: 100,
          child: Categories(
            selectedCategoryIndex: selectedCategory,
            model: categories,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: _getSliverWidgets(context),
        ),
      ),
    );
  }
}
