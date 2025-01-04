import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/features/core/theme/app_pallete.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: CupertinoColors.systemBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: CupertinoColors.systemBackground,
    ),
    cardTheme: CardTheme(
      color: CupertinoColors.secondarySystemBackground,
      shadowColor: Colors.grey.shade100,
      elevation: 5,
    ),
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
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    appBarTheme: AppBarTheme(
      backgroundColor: CupertinoColors.darkBackgroundGray,
    ),
    cardTheme: CardTheme(
      color: CupertinoColors.secondaryLabel,
      shadowColor: CupertinoColors.black,
      elevation: 5,
    ),
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
