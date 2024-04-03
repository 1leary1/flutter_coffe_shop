part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  ProductsLoaded({
    required this.categories,
  });

  final List<CategoryModel> categories;
}

final class ProductsFailure extends ProductsState {}
