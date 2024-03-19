import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

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
              //Добавить урл модели
              imageUrl:
                  'https://master-cofe.ru/wp-content/uploads/2019/07/788772_1538912168.9453_original.jpg',
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
              'Олеато',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        // Внести цену модели
        Text(
          '139 ₽',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
