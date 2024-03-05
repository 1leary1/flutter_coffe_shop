import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryAppbarItem extends StatefulWidget {
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
  State<CategoryAppbarItem> createState() => _CategoryAppbarItemState();
}

class _CategoryAppbarItemState extends State<CategoryAppbarItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: widget.selectedIndex == widget.currentIndex
                ? AppColors.primary
                : AppColors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
          onPressed: () {
            widget.onTap();
          },
          child: Text(widget.model?.title ?? 'loading'),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
