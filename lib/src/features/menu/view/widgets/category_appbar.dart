import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/services/scroll_services.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final List<CategoryModel?> model;
  late int selectedCategoryIndex;

  Categories(
      {super.key, required this.model, required this.selectedCategoryIndex});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  _onTap(int index) {
    setState(() {
      widget.selectedCategoryIndex = index;
      ScrollServices.scrollToItem(widget.model[index]!.verticalKey);
      ScrollServices.scrollToItem(widget.model[index]!.horizonalKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.model.length,
      itemBuilder: ((context, index) {
        return CategoryAppbarItem(
          horizontalKey: widget.model[index]!.horizonalKey,
          model: widget.model[index],
          selectedIndex: widget.selectedCategoryIndex,
          currentIndex: index,
          onTap: () {
            _onTap(index);
          },
        );
      }),
    );
  }
}
