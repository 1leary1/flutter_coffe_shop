import 'package:coffe_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffe_shop/src/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
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
