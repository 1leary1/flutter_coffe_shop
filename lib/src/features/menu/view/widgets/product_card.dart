import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:coffe_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final ProductModel? model;
  const ProductCard({super.key, required this.model});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _decrementCouner,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primary,
              ),
              child: Center(
                child: Text(
                  '–',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ),
          Container(
            height: 25,
            width: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primary,
            ),
            child: Center(
                child: Text(
              _count.toString(),
              style: Theme.of(context).textTheme.displaySmall,
            )),
          ),
          GestureDetector(
            onTap: _incrementCouner,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primary,
              ),
              child: Center(
                child: Text(
                  '+',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: _incrementCouner,
        child: Container(
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primary,
          ),
          child: Center(
            child: Text(
              '${widget.model?.price.toString() ?? 'loading'} руб.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 196,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              widget.model?.image ?? ImageSources.nullDrink,
              height: 100,
            ),
            Text(
              widget.model?.name ?? 'Drink',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            _priceOrCount(),
          ],
        ),
      ),
    );
  }
}
