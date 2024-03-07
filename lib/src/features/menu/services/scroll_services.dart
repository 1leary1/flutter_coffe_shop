import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:flutter/material.dart';

class ScrollServices {
  static void scrollToItem(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  static void scrollToItemOnTap(
      int index, int selectedCategoryIndex, Categories widget) {
    selectedCategoryIndex = index;
    ScrollServices.scrollToItem(widget.model[index]!.verticalKey);
  }
}
