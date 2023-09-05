import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

TextTheme textTheme = TextTheme(
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium,
  bodySmall: bodySmall,
  displayLarge: displayLarge,
  displayMedium: displayMedium,
  displaySmall: displaySmall,
);

TextStyle bodyLarge = const TextStyle(
  color: AppColors.black1,
  fontSize: 18,
);

TextStyle bodyMedium = const TextStyle(
  color: AppColors.black1,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

TextStyle bodySmall = const TextStyle(
  color: AppColors.grey3,
  fontSize: 14,
);

TextStyle displayLarge = const TextStyle(
  color: AppColors.black1,
  fontSize: 28,
  fontWeight: FontWeight.w600,
);

TextStyle displayMedium = const TextStyle(
  color: AppColors.black1,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

TextStyle displaySmall = const TextStyle(
  color: AppColors.black1,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
