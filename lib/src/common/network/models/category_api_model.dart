import 'package:coffe_shop/src/common/network/api_request.dart';
import 'package:coffe_shop/src/common/network/models/product_api_model.dart';

class CategoryApiModel {
  final int id;
  final String slug;

  CategoryApiModel({
    required this.id,
    required this.slug,
  });

  factory CategoryApiModel.fromJson(Map<String, dynamic> json) {
    return CategoryApiModel(
      id: json["id"],
      slug: json["slug"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
      };
}
