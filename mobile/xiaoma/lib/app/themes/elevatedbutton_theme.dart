import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: elevatedButtonStyle,
);


ButtonStyle elevatedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateColor.resolveWith(
    (states) => AppColors.primaryColor,
  ),
  padding: MaterialStateProperty.all(
    const EdgeInsets.symmetric(vertical: 20),
  ),
  alignment: Alignment.center,
  iconColor: MaterialStateColor.resolveWith((states) => AppColors.black1),
  
  textStyle: MaterialStateProperty.all(
    const TextStyle(
      color: AppColors.black1,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  elevation: MaterialStateProperty.all(0),
);
