import 'product_model.dart';

class CategoryModel {
  final String title;
  final List<ProductModel> productsList;

  CategoryModel({
    required this.title,
    required this.productsList,
  });
}
