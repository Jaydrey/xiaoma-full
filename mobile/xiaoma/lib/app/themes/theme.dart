import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

ThemeData appTheme = ThemeData(
  colorScheme: colorScheme,
  primarySwatch: const MaterialColor(
    0xFF77DD77,
    {
      50: AppColors.primaryColor,
      100: AppColors.primaryColor,
      200: AppColors.primaryColor,
      300: AppColors.primaryColor,
      400: AppColors.primaryColor,
      500: AppColors.primaryColor,
      600: AppColors.primaryColor,
      700: AppColors.primaryColor,
      800: AppColors.primaryColor,
      900: AppColors.primaryColor,
    },
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  fontFamily: "Poppins",
  appBarTheme:appBarTheme,
  useMaterial3: true,
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: textButtonThemeData,
);
