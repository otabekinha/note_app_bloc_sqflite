import 'package:flutter/material.dart';
import 'package:note_app/src/features/core/theme/app_pallete.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    primaryColor: AppPallete.primaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppPallete.primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primaryColor,
        foregroundColor: Colors.white,
        iconColor: Colors.white,
      ),
    ),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppPallete.primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primaryColor,
        foregroundColor: Colors.white,
        iconColor: Colors.white,
      ),
    ),
  );
}
