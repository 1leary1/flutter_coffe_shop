import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';

import '../../../../common/database/database.dart';

class MenuCategoryDto {
  final int id;
  final String slug;

  const MenuCategoryDto({
    required this.id,
    required this.slug,
  });

  static MenuCategoryDto fromDb(Category category) {
    return MenuCategoryDto(
      id: category.id,
      slug: category.title,
    );
  }

  factory MenuCategoryDto.fromJson(Map<String, dynamic> json) {
    return MenuCategoryDto(
      id: json["id"],
      slug: json["slug"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
      };

  CategoryModel toModel() {
    return CategoryModel(
      id: id.toString(),
      title: slug,
      productsList: [],
    );
  }
}
