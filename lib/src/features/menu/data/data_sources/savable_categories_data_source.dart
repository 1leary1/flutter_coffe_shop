import 'package:coffe_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffe_shop/src/common/database/database.dart';
import 'package:coffe_shop/src/features/menu/modeles/dto/menu_category_dto.dart';

abstract interface class ISavableCategoriesDataSource
    implements ICategoriesDataSource {
  Future<void> saveCategories({required List<MenuCategoryDto> categories});
}

final class DbCategoriesDataSource implements ISavableCategoriesDataSource {
  final AppDatabase _menuDb;

  const DbCategoriesDataSource({required AppDatabase menuDb})
      : _menuDb = menuDb;

  @override
  Future<List<MenuCategoryDto>> fetchCategories() async {
    List<Category> items = await _menuDb.select(_menuDb.categories).get();

    return items.map((e) => MenuCategoryDto.fromDb(e)).toList();
  }

  @override
  Future<void> saveCategories(
      {required List<MenuCategoryDto> categories}) async {
    await _menuDb.delete(_menuDb.categories).go();
    for (var category in categories) {
      await _menuDb.into(_menuDb.categories).insert(CategoriesCompanion.insert(
            id: category.id,
            title: category.slug,
          ));
    }
  }
}
