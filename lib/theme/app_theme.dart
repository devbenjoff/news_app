import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';

final newsAppLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    onPrimary: AppColors.black,
    onSecondary: AppColors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.tertiary,
    foregroundColor: Colors.white,
  ),
  textTheme: kAppTextTheme,
);

final newsAppDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    onPrimary: AppColors.white,
    onSecondary: AppColors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.tertiary,
    foregroundColor: Colors.white,
  ),
  textTheme: kAppTextTheme,
);

const TextTheme kAppTextTheme = TextTheme(
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  bodyLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  ),
);
