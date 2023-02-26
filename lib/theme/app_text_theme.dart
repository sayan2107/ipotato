import 'package:flutter/material.dart';

class AppTextTheme {
  const AppTextTheme(TextTheme textTheme);

  factory AppTextTheme.of(BuildContext context) =>
      AppTextTheme(Theme.of(context).textTheme);

  Color get textColor => Colors.black;

  TextStyle get h1 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 32,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h2 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 22,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h3 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h4 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h5 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get h6 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w400,
      );
}
