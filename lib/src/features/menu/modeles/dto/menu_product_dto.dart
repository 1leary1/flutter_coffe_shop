import 'package:coffe_shop/src/common/database/database.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'dart:ui' as ui;

class MenuProductDto {
  final int id;
  final int page;
  final String name;
  final String description;
  final CategoryInnerDto category;
  final String imageUrl;
  final List<Price> prices;

  const MenuProductDto({
    required this.id,
    required this.page,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.prices,
  });

  factory MenuProductDto.fromJson(Map<String, dynamic> json) => MenuProductDto(
        id: json["id"],
        page: 0,
        name: json["name"],
        description: json["description"],
        category: CategoryInnerDto.fromJson(json["category"]),
        imageUrl: json["imageUrl"],
        prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page": page,
        "name": name,
        "description": description,
        "category": category.toJson(),
        "imageUrl": imageUrl,
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
      };

  ProductModel toModel() {
    final localeType = ui.window.locale;
    return ProductModel(
      id: id,
      imageUrl: imageUrl,
      name: name,
      price:
          localeType.toString() == 'en_US' ? prices[1].value : prices[0].value,
    );
  }

  static MenuProductDto fromDb(Product product) {
    return MenuProductDto(
      id: product.id,
      page: product.page,
      name: product.name,
      description: '',
      category: CategoryInnerDto(id: product.categoryId, slug: ''),
      imageUrl: product.imageUrl,
      prices: [Price(value: product.price, currency: 'RUB')],
    );
  }

  Product toDb() {
    return Product(
      id: id,
      page: page,
      categoryId: category.id,
      imageUrl: imageUrl,
      name: name,
      price: prices[0].value,
    );
  }
}

class CategoryInnerDto {
  final int id;
  final String slug;

  CategoryInnerDto({
    required this.id,
    required this.slug,
  });

  factory CategoryInnerDto.fromJson(Map<String, dynamic> json) =>
      CategoryInnerDto(
        id: json["id"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
      };
}

class Price {
  final String value;
  final String currency;

  Price({
    required this.value,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        value: json["value"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currency,
      };
}
