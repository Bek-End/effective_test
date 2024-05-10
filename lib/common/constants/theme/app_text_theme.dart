import 'package:effective_test/common/constants/app_colors.dart';
import 'package:effective_test/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextTheme extends TextTheme {
  const AppTextTheme({required Color primaryColor})
      : _primaryColor = primaryColor;

  final Color _primaryColor;

  TextStyle get title1 => AppTextStyles.title1.copyWith(color: _primaryColor);
  TextStyle get title2 => AppTextStyles.title2.copyWith(color: _primaryColor);
  TextStyle get title3 => AppTextStyles.title3.copyWith(color: _primaryColor);
  TextStyle get title4 => AppTextStyles.title4.copyWith(color: _primaryColor);
  TextStyle get text1 => AppTextStyles.text1.copyWith(color: _primaryColor);
  TextStyle get text2 => AppTextStyles.text2.copyWith(color: _primaryColor);
  TextStyle get buttonText =>
      AppTextStyles.buttonText.copyWith(color: _primaryColor);
  TextStyle get tabText => AppTextStyles.tabText.copyWith(color: _primaryColor);
}

class DarkAppTextTheme extends AppTextTheme {
  DarkAppTextTheme() : super(primaryColor: AppColors.darkBasic.shadeF);
}
