import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData get themeData {
    // TODO define your own flavors if needed
    return ThemeData(primaryColor: Colors.blueGrey);
  }
}

extension CustomTextTheme on TextTheme {}

extension CustomColorScheme on ColorScheme {}
