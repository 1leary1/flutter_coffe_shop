import 'package:coffe_shop/src/features/menu/bloc/products_bloc.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_appbar.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/product_grid.dart';
import 'package:coffe_shop/src/features/order/view/widgets/cart_button.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<CategoryModel> loadingData = [
    const CategoryModel(title: 'Загрузка...', productsList: []),
  ];

  final _productsBloc = ProductsBloc(
    GetIt.I<List<CategoryModel>>(),
  );
  final itemMenuScrollController = ItemScrollController();
  final itemAppbarScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  late int selectedCategoryIndex;
  //late List<CategoryModel> data = [];

  @override
  void initState() {
    _productsBloc.add(ProductsLoadingEvent());
    super.initState();
    //_fetchData();
    //data = loadingData;
    itemPositionsListener.itemPositions.addListener(_onChageVisibility);
    selectedCategoryIndex = 0;
  }

  //Future<void> _fetchData() async {
  //  try {
  //    List<CategoryApiModel> apiCategories = await ApiRequest.getCategories();
  //    final _data = await ModelAdapter.adaptCategoryList(apiCategories);
  //    setState(() {
  //      data = _data;
  //    });
  //  } catch (e) {
  //    debugPrint(e.toString());
  //  }
  //}

  _onChageVisibility() {
    final indices = itemPositionsListener.itemPositions.value
        .map((item) => item.index)
        .toList();

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
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: 100,
          child: BlocBuilder<ProductsBloc, ProductsState>(
            bloc: _productsBloc,
            builder: (context, state) {
              if (state is ProductsLoading) {
                return CategoriesAppBar(
                  appBarItemScrollController: itemAppbarScrollController,
                  menuItemScrollController: itemMenuScrollController,
                  selectedCategoryIndex: selectedCategoryIndex,
                  model: const [],
                );
              }
              if (state is ProductsLoaded) {
                return CategoriesAppBar(
                  appBarItemScrollController: itemAppbarScrollController,
                  menuItemScrollController: itemMenuScrollController,
                  selectedCategoryIndex: selectedCategoryIndex,
                  model: state.categories,
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
      floatingActionButton: const CartButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ProductsBloc, ProductsState>(
          bloc: _productsBloc,
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
            }
            if (state is ProductsLoaded) {
              return ScrollablePositionedList.builder(
                itemPositionsListener: itemPositionsListener,
                itemScrollController: itemMenuScrollController,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return ProdustGrid(model: state.categories[index]);
                },
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.white,
            ));
          },
        ),
      ),
    );
  }
}
