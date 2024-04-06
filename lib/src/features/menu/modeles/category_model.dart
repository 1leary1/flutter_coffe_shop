import 'product_model.dart';

class CategoryModel {
  final String title;
  final List<ProductModel> productsList;

  const CategoryModel({
    required this.title,
    required this.productsList,
  });
}
