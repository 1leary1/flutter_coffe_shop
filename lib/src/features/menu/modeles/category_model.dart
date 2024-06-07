import 'product_model.dart';

class CategoryModel {
  final String id;
  final String title;
  final List<ProductModel> productsList;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.productsList,
  });
}
