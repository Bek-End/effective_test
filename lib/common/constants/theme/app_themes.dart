import 'package:effective_test/common/constants/app_colors.dart';
import 'package:effective_test/common/constants/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData get darkTheme {
    const textTheme = DarkAppTextTheme();

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black,
        titleTextStyle: textTheme.title1,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        backgroundColor: AppColors.black,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.grey6,
        selectedItemColor: AppColors.blue,
      ),
    );
  }
}
