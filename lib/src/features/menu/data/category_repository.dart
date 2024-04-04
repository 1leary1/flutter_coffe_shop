import 'package:coffe_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/data_sources/savable_categories_data_source.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'dart:io';

import 'package:coffe_shop/src/features/menu/modeles/dto/menu_category_dto.dart';

abstract interface class ICategoryRepository {
  Future<List<CategoryModel>> loadCategories();
}

final class CategoriesRepository implements ICategoryRepository {
  final ICategoriesDataSource _networkCategoriesDataSource;
  final ISavableCategoriesDataSource _dbCategoriesDataSource;

  const CategoriesRepository({
    required ICategoriesDataSource networkCategoriesDataSource,
    required ISavableCategoriesDataSource dbCategoriesDataSource,
  })  : _networkCategoriesDataSource = networkCategoriesDataSource,
        _dbCategoriesDataSource = dbCategoriesDataSource;

  @override
  Future<List<CategoryModel>> loadCategories() async {
    var dtos = <MenuCategoryDto>[];
    try {
      dtos = await _networkCategoriesDataSource.fetchCategories();
      //_dbCategoriesDataSource.saveCategories(categories: dtos);
    } on SocketException {
      dtos = await _dbCategoriesDataSource.fetchCategories();
    }
    return dtos.map((e) => e.toModel()).toList();
  }
}
