import 'dart:io';

import 'package:coffe_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/data_sources/savable_menu_data_source.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/dto/menu_product_dto.dart';

import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';

abstract interface class IMenuRepository {
  Future<List<ProductModel>> loadMenuItems(
      {required CategoryModel category, int page = 0, int limit = 25});
}

final class MenuRepository implements IMenuRepository {
  final IMenuDataSource _networkMenuDataSource;
  final ISavableMenuDataSource _dbMenuDataSource;

  const MenuRepository({
    required IMenuDataSource networkMenuDataSource,
    required ISavableMenuDataSource dbMenuDataSource,
  })  : _networkMenuDataSource = networkMenuDataSource,
        _dbMenuDataSource = dbMenuDataSource;

  @override
  Future<List<ProductModel>> loadMenuItems(
      {required CategoryModel category, int page = 0, int limit = 25}) async {
    var dtos = <MenuProductDto>[];
    try {
      dtos = await _networkMenuDataSource.fetchMenuItems(
          categoryId: category.id, page: page, limit: limit);
      _dbMenuDataSource.saveMenuItems(menuItems: dtos);
    } on SocketException {
      dtos = await _dbMenuDataSource.fetchMenuItems(
          categoryId: category.id, page: page, limit: limit);
    }
    return dtos.map((e) => e.toModel()).toList();
  }
}
