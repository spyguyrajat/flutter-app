import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.pink,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
  ).copyWith(
    secondary: Colors.white,
  ),
);

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Colors.purple,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
  ).copyWith(
    secondary: Colors.white,
  ),
);
