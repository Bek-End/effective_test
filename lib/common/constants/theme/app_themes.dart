import 'package:effective_test/common/constants/theme/app_colors_schemes.dart';
import 'package:effective_test/common/constants/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData get darkTheme {
    final textTheme = DarkAppTextTheme();
    final colorSchemes = DarkColorSchemes();

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colorSchemes.basic.shade0,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorSchemes.basic.shade0,
        titleTextStyle: textTheme.title1,
        iconTheme: IconThemeData(color: colorSchemes.basic.shade0),
      ),
      dividerColor: colorSchemes.basic.shade4,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorSchemes.basic,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: textTheme.title3,
        subtitleTextStyle: textTheme.text2.copyWith(
          color: colorSchemes.basic.shade5,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        backgroundColor: colorSchemes.basic.shade0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: colorSchemes.basic.shade6,
        selectedItemColor: colorSchemes.blue,
        unselectedIconTheme: IconThemeData(color: colorSchemes.basic.shade6),
        selectedIconTheme: IconThemeData(color: colorSchemes.blue),
        unselectedLabelStyle: textTheme.tabText.copyWith(
          color: colorSchemes.basic.shade6,
        ),
        selectedLabelStyle: textTheme.tabText.copyWith(
          color: colorSchemes.blue,
        ),
      ),
    );
  }
}
