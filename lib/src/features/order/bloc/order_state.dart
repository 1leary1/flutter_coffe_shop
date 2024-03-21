part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderBaseState extends OrderState {
  OrderBaseState({
    required this.products,
  });

  final List<ProductModel> products;
}
