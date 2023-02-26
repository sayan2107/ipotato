import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  static const Color green = Colors.green;
  static const Color darkGreen = Color(0xFF216C2E);
  static const Color lightGreen = Color(0xFFA7F5A7);
  static const Color lightPurple = Color(0xFFE1DFFF);
  static const Color lightBlue = Color(0xFFFBFCFE);
  static const Color darkBlue = Color(0xFF006782);
  static const Color darkestBlue = Color(0xFF181837);
  static const Color darkPurple = Color(0xFF5B5B7D);
  static const Color sky = Color(0xFFB6EAFF);
  static const Color lightGray = Color(0xFFE5E5E5);
  static const Color gray = Color(0xFF70787D);
  static const Color darkGray = Color(0xFF40484C);
}
