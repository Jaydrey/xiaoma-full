import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
  fillColor: AppColors.grey3,
  hintStyle: TextStyle(
    fontSize: 16,
    color: AppColors.grey3,
  ),
  labelStyle: TextStyle(
    fontSize: 16,
    color: AppColors.grey3,
  ),
  prefixStyle: TextStyle(
    color: AppColors.black1,
  ),
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
      style: BorderStyle.none,
    ),
  ),
);
