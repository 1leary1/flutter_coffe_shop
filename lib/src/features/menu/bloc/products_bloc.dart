import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/common/network/api_request.dart';
import 'package:coffe_shop/src/common/network/models/category_api_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/order/utils/model_adapter.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.categories) : super(ProductsInitial()) {
    on<ProductsLoadingEvent>((event, emit) async {
      emit(ProductsLoading());
      List<CategoryApiModel> apiCategories = await ApiRequest.getCategories();
      final categoriesList =
          await ModelAdapter.adaptCategoryList(apiCategories);
      emit(ProductsLoaded(categories: categoriesList));
    });
  }

  final List<CategoryModel> categories;
}
