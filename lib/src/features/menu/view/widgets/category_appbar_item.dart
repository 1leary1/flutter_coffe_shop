import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryAppbarItem extends StatefulWidget {
  final CategoryModel? model;
  bool isSelected;
  CategoryAppbarItem(
      {super.key, required this.model, required this.isSelected});

  @override
  State<CategoryAppbarItem> createState() => _CategoryAppbarItemState();
}

class _CategoryAppbarItemState extends State<CategoryAppbarItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:
            widget.isSelected ? AppColors.primary : AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      onPressed: () {
        print('Pressed');
      },
      child: Text(widget.model?.title ?? 'loading'),
    );
  }
}
