import 'dart:convert';
import 'dart:io';

import 'package:coffe_shop/src/common/network/coffe_api.dart';
import 'package:coffe_shop/src/features/menu/modeles/dto/menu_product_dto.dart';
import 'package:http/http.dart' as http;

abstract interface class IMenuDataSource {
  Future<List<MenuProductDto>> fetchMenuItems(
      {required String categoryId, int page = 0, int limit = 25});
}

final class NetworkMenuDataSource implements IMenuDataSource {
  final http.Client _client;

  const NetworkMenuDataSource({required http.Client client}) : _client = client;

  @override
  Future<List<MenuProductDto>> fetchMenuItems(
      {required String categoryId, int page = 0, int limit = 25}) async {
    final response = await _client.get(Uri.parse(
        '${CoffeApi.baseUrl}v1/products?page=$page&limit=10&category=$categoryId'));

    if (response.statusCode == 200) {
      final List<MenuProductDto> products = [];
      for (var item in jsonDecode(utf8.decode(response.bodyBytes))['data']) {
        products.add(MenuProductDto.fromJson(item));
      }
      return products;
    } else {
      throw const SocketException('Server is not response');
    }
  }
}
