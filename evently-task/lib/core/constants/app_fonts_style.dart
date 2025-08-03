import 'package:evently_application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppFontStyle {
  static ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: AppColors.primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: AppColors.blackFont,
      ),
    ),
  );
}
