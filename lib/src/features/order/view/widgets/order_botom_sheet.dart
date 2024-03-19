import 'package:coffe_shop/src/common/network/models/product_api_model.dart';
import 'package:coffe_shop/src/features/order/view/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class OrderBottomSheet extends StatelessWidget {
  final List<ProductApiModel> products;

  const OrderBottomSheet({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ваш заказ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumbs_up_down),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: 3,
              itemBuilder: (context, index) => OrderItem(),
            ),
          ),
        ],
      ),
    );
  }
}
