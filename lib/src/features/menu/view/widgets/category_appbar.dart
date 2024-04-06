import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar_item.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoriesAppBar extends StatefulWidget {
  final List<CategoryModel?> model;
  final ItemScrollController menuItemScrollController;
  final ItemScrollController appBarItemScrollController;
  late int selectedCategoryIndex;
  late bool isScrollAble;

  CategoriesAppBar({
    super.key,
    required this.model,
    required this.selectedCategoryIndex,
    required this.menuItemScrollController,
    required this.appBarItemScrollController,
    required this.isScrollAble,
  });

  @override
  State<CategoriesAppBar> createState() => _CategoriesAppBarState();
}

class _CategoriesAppBarState extends State<CategoriesAppBar> {
  _onTap(int index) {
    setState(() {
      widget.isScrollAble = false;
      widget.selectedCategoryIndex = index;
      widget.menuItemScrollController.scrollTo(
        index: index,
        alignment: 0.0,
        duration: const Duration(milliseconds: 450),
      );

      widget.appBarItemScrollController.scrollTo(
        index: index,
        alignment: 0.1,
        duration: const Duration(milliseconds: 450),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      scrollDirection: Axis.horizontal,
      itemScrollController: widget.appBarItemScrollController,
      itemCount: widget.model.length,
      itemBuilder: ((context, index) {
        return CategoryAppbarItem(
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
