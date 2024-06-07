import 'dart:convert';
import 'dart:io';

import 'package:coffe_shop/src/common/network/coffe_api.dart';
import 'package:coffe_shop/src/features/menu/modeles/dto/menu_category_dto.dart';
import 'package:http/http.dart' as http;

abstract interface class ICategoriesDataSource {
  Future<List<MenuCategoryDto>> fetchCategories();
}

final class NetworkCategoriesDataSource implements ICategoriesDataSource {
  final http.Client _client;

  const NetworkCategoriesDataSource({
    required http.Client client,
  }) : _client = client;

  @override
  Future<List<MenuCategoryDto>> fetchCategories() async {
    final response = await _client
        .get(Uri.parse('${CoffeApi.baseUrl}v1/products/categories'));

    if (response.statusCode == 200) {
      final List<MenuCategoryDto> categoriesDto = [];
      for (var item in jsonDecode(utf8.decode(response.bodyBytes))['data']) {
        categoriesDto.add(MenuCategoryDto.fromJson(item));
      }
      return categoriesDto;
    } else {
      throw const SocketException('Server is not response');
    }
  }
}
