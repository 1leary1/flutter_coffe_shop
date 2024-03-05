import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final List<CategoryModel?> model;

  const Categories({super.key, required this.model});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late int _SelectedCategoryIndex = 0;

  _onTap(int index) {
    setState(() {
      _SelectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.model.length,
      itemBuilder: ((context, index) {
        return CategoryAppbarItem(
          model: widget.model[index],
          selectedIndex: _SelectedCategoryIndex,
          currentIndex: index,
          onTap: () {
            _onTap(index);
          },
        );
      }),
    );
  }
}
