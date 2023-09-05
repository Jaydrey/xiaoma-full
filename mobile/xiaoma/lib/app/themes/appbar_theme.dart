import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xiaoma/app/app.dart';

AppBarTheme appBarTheme = AppBarTheme(
  systemOverlayStyle: const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
  ),
  color: AppColors.white,
  scrolledUnderElevation: 0,
  elevation: 0,
  titleTextStyle: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black2,
  ),
  centerTitle: false,
  iconTheme: iconTheme,
  actionsIconTheme: actionsIconTheme,
);

IconThemeData iconTheme = const IconThemeData(
  color: AppColors.black1,
  size: 28,
);

IconThemeData actionsIconTheme = const IconThemeData(
  color: AppColors.green1,
  size: 28,
);
