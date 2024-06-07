import 'package:coffe_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffe_shop/src/common/database/database.dart';
import 'package:coffe_shop/src/features/menu/modeles/dto/menu_product_dto.dart';
import 'package:drift/drift.dart';

abstract interface class ISavableMenuDataSource implements IMenuDataSource {
  Future<void> saveMenuItems({required List<MenuProductDto> menuItems});
}

final class DbMenuDataSource implements ISavableMenuDataSource {
  final AppDatabase _menuDb;

  const DbMenuDataSource({required AppDatabase menuDb}) : _menuDb = menuDb;

  @override
  Future<List<MenuProductDto>> fetchMenuItems(
      {required String categoryId, int page = 0, int limit = 25}) async {
    final query = _menuDb.select(_menuDb.products)
      ..where((t) => t.categoryId.equals(int.parse(categoryId)))
      ..limit(limit);

    final result = await query.get();
    List<Product> items = result
        .map((row) => Product(
              id: row.id,
              page: row.page,
              categoryId: row.categoryId,
              imageUrl: row.imageUrl,
              name: row.name,
              price: row.price,
            ))
        .toList();

    return items.map((e) => MenuProductDto.fromDb(e)).toList();
  }

  @override
  Future<void> saveMenuItems({required List<MenuProductDto> menuItems}) async {
    if (menuItems.isNotEmpty) {
      _menuDb.delete(_menuDb.products)
        ..where((tbl) => tbl.categoryId.equals(menuItems.first.category.id))
        ..go();

      menuItems.forEach((element) async {
        await _menuDb.into(_menuDb.products).insert(ProductsCompanion(
              id: Value(element.id),
              page: Value(element.page),
              categoryId: Value(element.category.id),
              imageUrl: Value(element.imageUrl),
              name: Value(element.name),
              price: Value(element.prices[0].value),
            ));
      });
    }
  }
}
