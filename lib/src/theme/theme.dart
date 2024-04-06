import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  canvasColor: Colors.transparent,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    modalBackgroundColor: AppColors.white,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: AppColors.white,
      fontSize: 12,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);
