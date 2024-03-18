import 'dart:convert';

import 'package:coffe_shop/src/common/network/models/category_api_model.dart';
import 'package:coffe_shop/src/common/network/models/product_api_model.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  static Future<List<ProductApiModel>> getProductByCategory(categoryId) async {
    final response = await http.get(Uri.parse(
        'https://coffeeshop.academy.effective.band/api/v1/products?page=0&limit=10&category=$categoryId'));

    if (response.statusCode == 200) {
      final List<ProductApiModel> products = [];
      for (var item in jsonDecode(utf8.decode(response.bodyBytes))['data']) {
        products.add(ProductApiModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Server is not response');
    }
  }

  static Future<List<CategoryApiModel>> getCategories() async {
    final response = await http.get(Uri.parse(
        'https://coffeeshop.academy.effective.band/api/v1/products/categories'));

    if (response.statusCode == 200) {
      final List<CategoryApiModel> categories = [];
      for (var item in jsonDecode(utf8.decode(response.bodyBytes))['data']) {
        categories.add(CategoryApiModel.fromJson(item));
      }
      return categories;
    } else {
      throw Exception('Server is not response');
    }
  }
}
