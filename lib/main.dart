import 'package:coffe_shop/src/common/network/firebase_notifications.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:coffe_shop/src/features/map/bloc/address/address_bloc.dart';
import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/modeles/product_model.dart';
import 'package:coffe_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffe_shop/src/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseNotifications().initForegroundNotifications();
  _initGetIt();
  runApp(const CoffeShop());
}

class CoffeShop extends StatelessWidget {
  const CoffeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme,
      home: const MenuScreen(),
    );
  }
}

void _initGetIt() {
  GetIt.I.registerLazySingleton<bool>(() => true);
  GetIt.I.registerLazySingleton<List<CategoryModel>>(() => []);
  GetIt.I.registerLazySingleton<List<ProductModel>>(() => []);
  GetIt.I.registerLazySingleton<AddressBloc>(() => AddressBloc());
}
