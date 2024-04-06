import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:coffe_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffe_shop/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  _initGetIt();
  runApp(const CoffeShop());
}

class CoffeShop extends StatelessWidget {
  const CoffeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const MenuScreen(),
    );
  }
}

void _initGetIt() {
  GetIt.I.registerLazySingleton<List<CategoryModel>>(() => []);
  GetIt.I.registerLazySingleton<List<ProductModel>>(() => []);
}
