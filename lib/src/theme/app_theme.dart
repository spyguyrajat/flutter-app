import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  final Color _lightThemeBackgroundColor = Color.fromRGBO(243, 56, 121, 1);
  final Color _appBarBackgroundColor = Color.fromRGBO(243, 56, 121, 1);
  final Color _primaryColor = Color.fromRGBO(243, 56, 121, 1);
  final Color _buttonBackgroundColor = Color.fromRGBO(0, 213, 127, 1);
  final Color _bottomNavigationBarBackgroundColor =
      Color.fromRGBO(243, 56, 121, 1);
  final Color _bottomNavigationBarSelectedItemColor =
      Color.fromRGBO(255, 255, 255, 1);
  final Color _bottomNavigationBarUnselectedItemColor =
      Color.fromRGBO(255, 255, 255, 0.74);

  final Color _darkThemeBackgroundColorDark = Color.fromRGBO(75, 39, 78, 1);
  final Color _appBarBackgroundColorDark = Color.fromRGBO(75, 39, 78, 1);
  final Color _primaryColorDark = Color.fromRGBO(75, 39, 78, 1);
  final Color _buttonBackgroundColorDark = Color.fromRGBO(222, 187, 99, 1);
  final Color _bottomNavigationBarBackgroundColorDark =
      Color.fromRGBO(75, 39, 78, 1);
}

class AppTheme {
  static final colorConstants = ColorConstants();

  final ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColorLight: colorConstants._primaryColor,
    backgroundColor: colorConstants._lightThemeBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: colorConstants._appBarBackgroundColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorConstants._bottomNavigationBarBackgroundColor,
      selectedItemColor: colorConstants._bottomNavigationBarSelectedItemColor,
      unselectedItemColor:
          colorConstants._bottomNavigationBarUnselectedItemColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          colorConstants._buttonBackgroundColor,
        ),
      ), // buttonColor: colorConstants._buttonBackgroundColor,
    ),
  );

  final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColorDark: colorConstants._primaryColorDark,
    backgroundColor: colorConstants._darkThemeBackgroundColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: colorConstants._appBarBackgroundColorDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorConstants._bottomNavigationBarBackgroundColorDark,
      selectedItemColor: colorConstants._bottomNavigationBarSelectedItemColor,
      unselectedItemColor:
          colorConstants._bottomNavigationBarUnselectedItemColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          colorConstants._buttonBackgroundColorDark,
        ),
      ), // buttonColor: colorConstants._buttonBackgroundColor,
    ),
  );
}
