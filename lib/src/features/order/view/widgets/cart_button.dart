import 'package:coffe_shop/src/features/order/view/widgets/order_botom_sheet.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  void onPressed() {}

  void _show(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: AppColors.white,
      context: context,
      builder: (ctx) => Container(
        alignment: Alignment.center,
        child: const OrderBottomSheet(
          products: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 99,
      child: FloatingActionButton.extended(
        onPressed: () => _show(context),
        icon: Icon(Icons.shopping_basket_outlined),
        label: Text(
          '139 ₽',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        hoverColor: AppColors.white,
      ),
    );
  }
}
