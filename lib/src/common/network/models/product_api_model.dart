class ProductApiModel {
  final int id;
  final String name;
  final String description;
  final Category category;
  final String imageUrl;
  final List<Price> prices;

  const ProductApiModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.prices,
  });

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      ProductApiModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        imageUrl: json["imageUrl"],
        prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category.toJson(),
        "imageUrl": imageUrl,
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final String slug;

  Category({
    required this.id,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
