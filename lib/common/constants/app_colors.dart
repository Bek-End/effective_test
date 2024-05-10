import 'package:flutter/material.dart';

abstract class AppColors {
  static const BaseColor darkBasic = BaseColor(
    0xFF0C0C0C,
    <int, Color>{
      0: Color(0xFF0C0C0C),
      1: Color(0xFF1D1E20),
      2: Color(0xFF2F3035),
      3: Color(0xFFF4F9FC),
      4: Color(0xFF3E3F43),
      5: Color(0xFF5E5F61),
      6: Color(0xFF9F9F9F),
      7: Color(0xFFDBDBDB),
      15: Color(0xFFFFFFFF),
    },
  );

  static const blue = Color(0xFF2261BC);
  static const darkBlue = Color(0xFF00427D);
  static const green = Color(0xFF3A633B);
  static const darkGreen = Color(0xFF1E341F);
  static const red = Color(0xFFFF5E5E);
  static const orange = Color(0xFFF36E36);
}

class BaseColor extends ColorSwatch<int> {
  const BaseColor(super.primary, super.swatch);

  Color get shade0 => this[0]!;
  Color get shade1 => this[1]!;
  Color get shade2 => this[2]!;
  Color get shade3 => this[3]!;
  Color get shade4 => this[4]!;
  Color get shade5 => this[5]!;
  Color get shade6 => this[6]!;
  Color get shade7 => this[7]!;
  Color get shadeF => this[15]!;
}
