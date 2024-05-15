part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class OrderAddItemEvent extends OrderEvent {
  OrderAddItemEvent({
    required this.model,
  });

  final ProductModel model;
}

class OrderRemoveItemEvent extends OrderEvent {
  OrderRemoveItemEvent({
    required this.model,
  });

  final ProductModel model;
}

class OrderRemoveAllItemsEvent extends OrderEvent {}

class PostOrderEvent extends OrderEvent {
  PostOrderEvent({required this.context});

  final BuildContext context;
}
