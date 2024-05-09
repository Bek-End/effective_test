import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const String sfProDisplay = 'SF Pro Display';

  static const TextStyle title1 = TextStyle(
    fontFamily: sfProDisplay,
    fontWeight: FontWeight.w600,
    fontSize: 22.0,
  );
  static const TextStyle title2 = TextStyle(
    fontFamily: sfProDisplay,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );
  static const TextStyle title3 = TextStyle(
    fontFamily: sfProDisplay,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
  static const TextStyle title4 = TextStyle(
    fontFamily: sfProDisplay,
    fontSize: 14.0,
  );
  static const TextStyle text1 = TextStyle(
    fontFamily: sfProDisplay,
    fontSize: 16.0,
  );
  static const TextStyle text2 = TextStyle(
    fontFamily: sfProDisplay,
    fontSize: 14.0,
  );
  static const TextStyle buttonText = TextStyle(
    fontFamily: sfProDisplay,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
  static const TextStyle tabText = TextStyle(
    fontFamily: sfProDisplay,
    fontSize: 11.0,
  );
}
