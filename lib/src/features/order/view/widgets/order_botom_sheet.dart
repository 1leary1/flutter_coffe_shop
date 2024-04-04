import 'package:coffe_shop/src/common/network/api_request.dart';
import 'package:coffe_shop/src/features/order/bloc/order_bloc.dart';
import 'package:coffe_shop/src/features/order/view/widgets/order_item.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:coffe_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class OrderBottomSheet extends StatefulWidget {
  final BuildContext ctx;
  final BuildContext context;

  const OrderBottomSheet({
    super.key,
    required this.ctx,
    required this.context,
  });

  @override
  State<OrderBottomSheet> createState() => _OrderBottomSheetState();
}

class _OrderBottomSheetState extends State<OrderBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ваш заказ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(widget.ctx);
                    widget.context
                        .read<OrderBloc>()
                        .add(OrderRemoveAllItemsEvent());
                  },
                  child: Image.asset(
                    ImageSources.bin,
                    width: 20,
                    height: 20,
                  ))
            ],
          ),
          const Divider(),
          BlocBuilder<OrderBloc, OrderState>(
            bloc: widget.context.read<OrderBloc>(),
            builder: (context, state) {
              if (state is OrderBaseState) {
                return Expanded(
                  child: ScrollablePositionedList.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => OrderItem(
                      model: state.products[index],
                    ),
                  ),
                );
              } else {
                return const Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              //TODO: post order
              //ApiRequest.postOrder(widget.context);
              widget.context.read<OrderBloc>().add(OrderRemoveAllItemsEvent());
            },
            style: TextButton.styleFrom(
              minimumSize: const Size(500, 56),
              backgroundColor: AppColors.primary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            child: Text(
              'Оформить заказ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
