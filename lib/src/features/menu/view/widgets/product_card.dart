import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:coffe_shop/src/features/order/bloc/order_bloc.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  final ProductModel model;
  const ProductCard({
    super.key,
    required this.model,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _count = 0;

  _incrementCouner() {
    if (_count < 10) {
      context.read<OrderBloc>().add(OrderAddItemEvent(model: widget.model));
      setState(() {
        _count++;
      });
    }
  }

  _decrementCouner() {
    if (_count > 0) {
      context.read<OrderBloc>().add(OrderRemoveItemEvent(model: widget.model));
      setState(() {
        _count--;
      });
    }
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
              "${widget.model.price} ₽",
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
            CachedNetworkImage(
              height: 100,
              imageUrl: widget.model.imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: AppColors.primary,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              widget.model.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            BlocListener<OrderBloc, OrderState>(
              listener: (context, state) {
                if (state is OrderAcceptedState) {
                  setState(() {
                    _count = 0;
                  });
                }
              },
              child: _priceOrCount(),
            ),
          ],
        ),
      ),
    );
  }
}
