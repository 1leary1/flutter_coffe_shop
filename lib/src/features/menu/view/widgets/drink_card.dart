import 'package:coffe_shop/src/features/menu/modeles/drink_model.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatefulWidget {
  final DrinkModel? model;
  const DrinkCard({super.key, required this.model});

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
  int _count = 0;

  _incrementCouner() {
    setState(() {
      if (_count < 10) _count++;
    });
  }

  _decrementCouner() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  Widget _priceOrCount() {
    if (_count > 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _decrementCouner,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primary,
              ),
              child: const Center(
                child: Text('-'),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(child: Text(_count.toString())),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: _incrementCouner,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primary,
              ),
              child: const Center(
                child: Text('+'),
              ),
            ),
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: _incrementCouner,
        child: Container(
          width: 128,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
                child: Text(
                    '${widget.model?.price.toString() ?? 'loading'} руб.')),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 192,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              widget.model?.image ?? 'assets/drink_null.png',
              height: 100,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(widget.model?.name ?? 'Drink'),
            const SizedBox(
              height: 4,
            ),
            _priceOrCount(),
          ],
        ),
      ),
    );
  }
}
