import 'package:coffe_shop/src/common/network/api_request.dart';
import 'package:coffe_shop/src/common/network/models/category_api_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/product_grid.dart';
import 'package:coffe_shop/src/features/order/utils/model_adapter.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:coffe_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../modeles/product_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<CategoryModel> categories = [
    CategoryModel(title: 'Черный Кофе', productsList: [
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
    ]),
    CategoryModel(title: 'Зеленый Чай', productsList: [
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
    ]),
    CategoryModel(title: 'Синий Пуэр', productsList: [
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
    ]),
    CategoryModel(title: 'Оранжевый Улун', productsList: [
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
      ProductModel(imageUrl: ImageSources.coffe, name: 'Кофе', price: '111'),
    ]),
  ];

  final itemMenuScrollController = ItemScrollController();
  final itemAppbarScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  late int selectedCategoryIndex;
  late List<CategoryModel> data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
    itemPositionsListener.itemPositions.addListener(_onChageVisibility);
    selectedCategoryIndex = 0;
  }

  Future<void> _fetchData() async {
    try {
      List<CategoryApiModel> apiCategories = await ApiRequest.getCategories();
      final _data = await ModelAdapter.adaptCategoryList(apiCategories);
      setState(() {
        data = _data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
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
            model: data,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ScrollablePositionedList.builder(
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemMenuScrollController,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ProdustGrid(model: data[index]);
          },
        ),
      ),
    );
  }
}
