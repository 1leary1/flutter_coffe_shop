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
}
