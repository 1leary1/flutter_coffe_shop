part of 'menu_bloc.dart';

sealed class MenuState {
  final List<CategoryModel>? categories;
  final List<ProductModel>? items;

  const MenuState({this.categories, this.items});
}

final class ProgressMenuState extends MenuState {
  const ProgressMenuState({super.items, super.categories});
}

final class SuccessfulMenuState extends MenuState {
  const SuccessfulMenuState({super.items, super.categories});
}

final class ErrorMenuState extends MenuState {
  const ErrorMenuState({super.items, super.categories});
}

final class IdleMenuState extends MenuState {
  const IdleMenuState({super.items, super.categories});
}
