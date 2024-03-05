import 'package:coffe_shop/src/features/menu/view/widgets/drink_card.dart';
import 'package:flutter/material.dart';

import '../modeles/drink_model.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final DrinkModel model1 =
      DrinkModel(image: 'assets/coffe1.png', name: 'Кофе', price: 123);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ok')),
      body: DrinkCard(model: model1),
    );
  }
}
