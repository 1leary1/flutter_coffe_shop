import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:flutter/material.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.products) : super(OrderInitial()) {
    on<OrderAddItemEvent>((event, emit) {
      products.add(event.model);
      debugPrint(products.toString());
      emit(OrderBaseState(products: products));
    });

    on<OrderRemoveItemEvent>((event, emit) {
      ProductModel productToRemove =
          products.firstWhere((product) => product.id == event.model.id);

      products.remove(productToRemove);
      emit(OrderBaseState(products: products));
    });

    on<OrderRemoveAllItemsEvent>((event, emit) {
      products.clear();
      emit(OrderAcceptedState());
    });
  }

  final List<ProductModel> products;
}
