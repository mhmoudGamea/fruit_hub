import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';

abstract class AppTheme {
  // light theme mode
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    fontFamily: 'cairo',
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(330, 54),
        backgroundColor: AppColors.primaryColor,
        textStyle: AppStyle.font16.copyWith(color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
  // dark theme mode
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    fontFamily: 'cairo',
    scaffoldBackgroundColor: AppColors.dark,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark,
      selectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(330, 54),
        backgroundColor: AppColors.primaryColor,
        textStyle: AppStyle.font16.copyWith(color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}
