import 'dart:convert';

import 'package:coffe_shop/src/common/network/models/category_api_model.dart';
import 'package:coffe_shop/src/common/network/models/product_api_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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

  static Future<void> postOrder(BuildContext context) async {
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
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Заказ создан'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Возникла ошибка при заказе'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
