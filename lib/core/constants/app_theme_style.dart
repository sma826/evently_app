import 'package:evently_application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      // showSelectedLabels: true,
    ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: AppColors.white,
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              )
          )
      )
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: AppColors.primaryColor,
    //   shape: CircleBorder()
    // ),
  );
  static ThemeData darkTheme = ThemeData();
}
