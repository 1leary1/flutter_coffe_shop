import 'package:coffe_shop/src/features/menu/bloc/menu_bloc.dart';
import 'package:coffe_shop/src/features/menu/data/category_repository.dart';
import 'package:coffe_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/data_sources/savable_categories_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/data_sources/savable_menu_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/database/database.dart';
import 'package:coffe_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/product_grid.dart';
import 'package:coffe_shop/src/features/order/bloc/order_bloc.dart';
import 'package:coffe_shop/src/features/order/view/widgets/cart_button.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late CategoriesRepository _categoryRepository;
  late MenuRepository _menuRepository;
  late MenuBloc _menuBloc;
  late AppDatabase _menuDb;
  final _orderBloc = OrderBloc(GetIt.I<List<ProductModel>>());
  final itemMenuScrollController = ItemScrollController();
  final itemAppbarScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  late int selectedCategoryIndex;

  @override
  void initState() {
    _menuDb = AppDatabase();
    _categoryRepository = CategoriesRepository(
        networkCategoriesDataSource:
            NetworkCategoriesDataSource(client: http.Client()),
        dbCategoriesDataSource: DbCategoriesDataSource(menuDb: _menuDb));
    _menuRepository = MenuRepository(
        networkMenuDataSource: NetworkMenuDataSource(client: http.Client()),
        dbMenuDataSource: DbMenuDataSource(menuDb: _menuDb));
    _menuBloc = MenuBloc(
        menuRepository: _menuRepository,
        categoryRepository: _categoryRepository);
    _menuBloc.add(const LoadCategoriesEvent());

    itemPositionsListener.itemPositions.addListener(_onChageVisibility);
    selectedCategoryIndex = 0;
    super.initState();
  }

  void _onChageVisibility() {
    final indices = itemPositionsListener.itemPositions.value
        .map((item) => item.index)
        .toList();
    if (indices.isEmpty) return;
    if (selectedCategoryIndex != indices[0]) {
      setState(() {
        selectedCategoryIndex = indices[0];
      });
      itemAppbarScrollController.scrollTo(
        index: selectedCategoryIndex,
        alignment: 0.1,
        duration: const Duration(milliseconds: 450),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _menuBloc,
        ),
        BlocProvider(
          create: (context) => _orderBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          title: SizedBox(
            height: 100,
            child: BlocBuilder<MenuBloc, MenuState>(
              bloc: _menuBloc,
              builder: (context, state) {
                if (state is ProgressMenuState) {
                  return CategoriesAppBar(
                    appBarItemScrollController: itemAppbarScrollController,
                    menuItemScrollController: itemMenuScrollController,
                    selectedCategoryIndex: selectedCategoryIndex,
                    model: const [],
                  );
                }
                if (state is IdleMenuState) {
                  return CategoriesAppBar(
                    appBarItemScrollController: itemAppbarScrollController,
                    menuItemScrollController: itemMenuScrollController,
                    selectedCategoryIndex: selectedCategoryIndex,
                    model: state.categories ?? [],
                  );
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.white,
                ));
              },
            ),
          ),
        ),
        backgroundColor: AppColors.background,
        floatingActionButton: BlocBuilder<OrderBloc, OrderState>(
          bloc: _orderBloc,
          builder: (context, state) {
            if (state is OrderBaseState) {
              double totalSum = state.products.fold(
                  0,
                  (double sum, ProductModel product) =>
                      sum + double.parse(product.price));

              return Visibility(
                visible: totalSum == 0 ? false : true,
                child: CartButton(
                  context: context,
                  totalPrice: totalSum.toInt(),
                ),
              );
            }
            return Container();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<MenuBloc, MenuState>(
            bloc: _menuBloc,
            builder: (context, state) {
              if (state is ProgressMenuState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              }
              if (state is IdleMenuState) {
                return ScrollablePositionedList.builder(
                  itemPositionsListener: itemPositionsListener,
                  itemScrollController: itemMenuScrollController,
                  itemCount: state.categories?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ProdustGrid(model: state.categories![index]);
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
