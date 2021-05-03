import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData get themeData {
    // TODO define your own flavors if needed
    return ThemeData(primaryColor: Color(0xff0160a3));
  }
}

extension CustomTextTheme on TextTheme {
  TextStyle get disassembledNameTS => TextStyle(
      fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16.0);

  TextStyle get locNameTS => TextStyle(
      fontWeight: FontWeight.w300, color: Color(0xff78909c), fontSize: 14.0);

  TextStyle get locParentNameTS => TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff78909c),
        fontSize: 14.0,
      );
}

extension CustomColorScheme on ColorScheme {}
