import 'package:coffe_shop/src/common/network/api_request.dart';
import 'package:coffe_shop/src/common/network/models/category_api_model.dart';
import 'package:coffe_shop/src/common/network/models/product_api_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';

class ModelAdapter {
  static Future<List<CategoryModel>> adaptCategoryList(
      List<CategoryApiModel> categoryApiList) async {
    List<CategoryModel> adaptedList = [];

    for (CategoryApiModel categoryApiModel in categoryApiList) {
      CategoryModel adaptedCategory = await adaptCategory(categoryApiModel);
      if (adaptedCategory.productsList.isNotEmpty) {
        adaptedList.add(adaptedCategory);
      }
    }

    return adaptedList;
  }

  static Future<CategoryModel> adaptCategory(
      CategoryApiModel categoryApiModel) async {
    List<ProductModel> productsList = [];
    List<ProductApiModel> productsApiList =
        await ApiRequest.getProductByCategory(categoryApiModel.id);
    for (var product in productsApiList) {
      productsList.add(adaptProduct(product));
    }

    return CategoryModel(
      title: categoryApiModel.slug,
      productsList: productsList,
    );
  }

  static ProductModel adaptProduct(ProductApiModel productApiModel) {
    return ProductModel(
      imageUrl: productApiModel.imageUrl,
      name: productApiModel.name,
      price: productApiModel.prices[0].value,
    );
  }
}
