import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryAppbarItem extends StatelessWidget {
  final CategoryModel? model;
  late int selectedIndex;
  late int currentIndex;
  Function onTap;

  CategoryAppbarItem({
    super.key,
    required this.model,
    required this.selectedIndex,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: currentIndex == 0 ? 16 : 0,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: selectedIndex == currentIndex
                ? AppColors.primary
                : AppColors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
          onPressed: () {
            onTap();
          },
          child: Text(
            model?.title ?? 'loading',
            style: selectedIndex == currentIndex
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
