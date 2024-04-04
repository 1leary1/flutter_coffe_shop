import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/features/menu/data/category_repository.dart';
import 'package:coffe_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';

part 'menu_event.dart';
part 'menu_state.dart';

const _pageLimit = 25;

final class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final IMenuRepository _menuRepository;
  final ICategoryRepository _categoryRepository;

  MenuBloc({
    required IMenuRepository menuRepository,
    required ICategoryRepository categoryRepository,
  })  : _menuRepository = menuRepository,
        _categoryRepository = categoryRepository,
        super(const IdleMenuState()) {
    on<MenuEvent>((event, emit) async {
      switch (event) {
        case LoadCategoriesEvent():
          await _loadCategories(event, emit);
        case LoadPageEvent():
          _loadMenuItems(event, emit);
      }
    });
  }

  CategoryModel? _currentPaginatedCategory;
  final int _currentPage = 0;

  Future<void> _loadCategories(
      LoadCategoriesEvent event, Emitter<MenuState> emit) async {
    emit(ProgressMenuState(items: state.items));
    try {
      final categories = await _categoryRepository.loadCategories();
      Future.delayed(Duration.zero);
      emit(SuccessfulMenuState(categories: categories, items: List.empty()));
    } on Object {
      emit(ErrorMenuState(categories: state.categories, items: state.items));
      rethrow;
    } finally {
      emit(IdleMenuState(categories: state.categories, items: state.items));
    }
  }

  Future<void> _loadMenuItems(
      LoadPageEvent event, Emitter<MenuState> emit) async {
    _currentPaginatedCategory ??= state.categories?.first;
    if (_currentPaginatedCategory == null) return;

    emit(ProgressMenuState(items: state.items));
    try {
      final items = await _menuRepository.loadMenuItems(
        category: _currentPaginatedCategory!,
        page: _currentPage,
        limit: _pageLimit,
      );
      if (items.length < _pageLimit) {
        // Обновить счетчик страниц и выбрать следующую категорию
      }
      emit(SuccessfulMenuState(categories: state.categories, items: items));
    } on Object {
      emit(ErrorMenuState(categories: state.categories, items: state.items));
      rethrow;
    } finally {
      emit(IdleMenuState(categories: state.categories, items: state.items));
    }
  }
}
