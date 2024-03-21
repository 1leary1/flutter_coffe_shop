import 'package:coffe_shop/src/common/network/api_request.dart';
import 'package:coffe_shop/src/common/network/models/product_api_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:coffe_shop/src/features/order/bloc/order_bloc.dart';
import 'package:coffe_shop/src/features/order/view/widgets/order_item.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
  final _orderBloc = OrderBloc(GetIt.I<List<ProductModel>>());

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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumbs_up_down),
              ),
            ],
          ),
          const Divider(),
          BlocBuilder<OrderBloc, OrderState>(
            bloc: widget.context.read<OrderBloc>(),
            builder: (context, state) {
              if (state is OrderBaseState) {
                print(state.toString());
                return Expanded(
                  child: ScrollablePositionedList.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => OrderItem(
                      model: state.products[index],
                    ),
                  ),
                );
              } else {
                print(state.toString());
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
          //Expanded(
          //  child: ScrollablePositionedList.builder(
          //    itemCount: 3,
          //    itemBuilder: (context, index) => const OrderItem(),
          //  ),
          //),
          TextButton(
            onPressed: () {
              Navigator.pop(widget.ctx);
              ApiRequest.postOrder(context);
            },
            style: TextButton.styleFrom(
              minimumSize: Size(500, 56),
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
