import 'package:flutter/material.dart';
import 'package:ipotato_timer/theme/font_family.dart';

class AppTextTheme {
  const AppTextTheme(TextTheme textTheme);

  factory AppTextTheme.of(BuildContext context) =>
      AppTextTheme(Theme.of(context).textTheme);

  Color get textColor => Colors.black;

  TextStyle get h1 => TextStyle(
        fontFamily: FontFamily.roboto,
        fontSize: 32,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h2 => TextStyle(
        fontFamily: FontFamily.roboto,
        fontSize: 22,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h3 => TextStyle(
        fontFamily: FontFamily.roboto,
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h4 => TextStyle(
        fontFamily: FontFamily.roboto,
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h5 => TextStyle(
        fontFamily: FontFamily.roboto,
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h6 => TextStyle(
        fontFamily: FontFamily.roboto,
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w400,
      );
}
