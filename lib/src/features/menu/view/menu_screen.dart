import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_sliver.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/drink_card.dart';
import 'package:flutter/material.dart';

import '../modeles/drink_model.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<DrinkModel> drinks = [
    DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
    DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
  ];

  final model1 =
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123);

  final List<CategoryModel> categories = [
    CategoryModel(title: 'Эшьпошьмак', drinksList: [
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
    ]),
    CategoryModel(title: 'Эшьпошьмак', drinksList: [
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
    ]),
    CategoryModel(title: 'Эшьпошьмак', drinksList: [
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
    ]),
    CategoryModel(title: 'Эшьпошьмак', drinksList: [
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(height: 100, child: Categories(model: categories)),
      ),
      backgroundColor: Colors.grey,
      body: DrinkCard(model: model1),
    );
  }
}
