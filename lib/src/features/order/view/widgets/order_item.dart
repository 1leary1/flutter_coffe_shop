import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final ProductModel model;
  const OrderItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              height: 55,
              width: 55,
              imageUrl: model.imageUrl,
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
            const SizedBox(
              width: 8,
            ),
            Text(
              model.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        Text(
          model.price,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
