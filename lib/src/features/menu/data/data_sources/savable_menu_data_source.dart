import 'package:coffe_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffe_shop/src/features/menu/modeles/dto/menu_product_dto.dart';

abstract interface class ISavableMenuDataSource implements IMenuDataSource {
  Future<void> saveMenuItems({required List<MenuProductDto> menuItems});
}

final class DbMenuDataSource implements ISavableMenuDataSource {
  // Put dependency of network class such as dio or http, e.g.
  // final IMenuDb _menuDb;

  const DbMenuDataSource(/*{required IMenuDb menuDb}*/) /* : _menuDb = menuDb*/;

  @override
  Future<List<MenuProductDto>> fetchMenuItems(
      {required String categoryId, int page = 0, int limit = 25}) {
    // TODO: implement fetchMenuItems
    throw UnimplementedError();
  }

  @override
  Future<void> saveMenuItems({required List<MenuProductDto> menuItems}) {
    // TODO: implement saveMenuItems
    throw UnimplementedError();
  }
}
