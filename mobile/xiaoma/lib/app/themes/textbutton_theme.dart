
import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

TextButtonThemeData textButtonThemeData =TextButtonThemeData(
  style: textButtonStyle,
);

ButtonStyle textButtonStyle = ButtonStyle(
  textStyle: MaterialStatePropertyAll(buttonTextStyle),
  
);

TextStyle buttonTextStyle = const TextStyle(
  color: AppColors.black1,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);