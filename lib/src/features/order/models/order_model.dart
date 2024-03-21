import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';

class OrderModel {
  final ProductModel product;
  final int count;

  OrderModel({
    required this.product,
    required this.count,
  });
}
