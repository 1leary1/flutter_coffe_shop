part of 'menu_bloc.dart';

sealed class MenuEvent {
  const MenuEvent();
}

final class LoadCategoriesEvent extends MenuEvent {
  const LoadCategoriesEvent();
}

final class LoadPageEvent extends MenuEvent {
  final int category;
  final int page;
  const LoadPageEvent({
    required this.category,
    required this.page,
  });
}
