import 'package:coffe_shop/src/features/order/view/widgets/order_botom_sheet.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final int totalPrice;
  final BuildContext context;

  const CartButton({
    super.key,
    required this.totalPrice,
    required this.context,
  });

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  void onPressed() {}

  void _show(BuildContext cxt) {
    showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: AppColors.white,
      context: context,
      builder: (ctx) => Container(
        alignment: Alignment.center,
        child: OrderBottomSheet(
          context: context,
          ctx: ctx,
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
        onPressed: () {
          _show(context);
        },
        icon: const Icon(Icons.shopping_basket_outlined),
        label: Text(
          '${widget.totalPrice} ₽',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        hoverColor: AppColors.white,
      ),
    );
  }
}
