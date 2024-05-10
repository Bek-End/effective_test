import 'package:effective_test/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppColorScheme {
  BaseColor get basic;

  Color get blue;
  Color get darkBlue;
  Color get green;
  Color get darkGreen;
  Color get red;
  Color get orange;
}

class DarkColorSchemes implements AppColorScheme {
  @override
  BaseColor get basic => AppColors.darkBasic;

  @override
  Color get blue => AppColors.blue;

  @override
  Color get darkBlue => AppColors.darkBlue;

  @override
  Color get darkGreen => AppColors.darkGreen;

  @override
  Color get green => AppColors.green;

  @override
  Color get orange => AppColors.orange;

  @override
  Color get red => AppColors.red;
}
