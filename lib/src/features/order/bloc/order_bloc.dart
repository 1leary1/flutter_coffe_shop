import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.products) : super(OrderInitial()) {
    on<OrderAddItemEvent>((event, emit) {
      products.add(event.model);
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

    on<PostOrderEvent>(
      (event, emit) async {
        final products = GetIt.I<List<ProductModel>>();
        Map<String, int> orderProducts = products.fold<Map<String, int>>(
          {},
          (Map<String, int> previousValue, ProductModel product) {
            previousValue.update(product.id.toString(), (value) => value + 1,
                ifAbsent: () => 1);
            return previousValue;
          },
        );
        final Map<String, dynamic> order = {
          "positions": orderProducts,
          "token": ""
        };
        final response = await http.post(
          Uri.parse('https://coffeeshop.academy.effective.band/api/v1/orders'),
          body: json.encode(order),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 201) {
          if (event.context.mounted) {
            ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                content: Text('Заказ создан'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          if (event.context.mounted) {
            ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                content: Text('Возникла ошибка при заказе'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      },
    );
  }

  final List<ProductModel> products;
}
