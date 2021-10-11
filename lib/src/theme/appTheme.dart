import 'package:flutter/material.dart';

class ColorConstants {
  final Color _appBarBackgroundColor = Colors.pink;
  final Color _appBarBackgroundColorDark = Colors.purple;
  final Color _primaryColor = Colors.pink;
  final Color _secondaryColor = Colors.white;
  final Color _primaryColorDark = Colors.purple;
  final Color _secondaryColorDark = Colors.white;
}

class AppTheme {
  static final colorConstants = ColorConstants();

  final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: colorConstants._primaryColor,
    backgroundColor: colorConstants._appBarBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: colorConstants._primaryColor,
    ).copyWith(
      secondary: colorConstants._secondaryColor,
    ),
  );

  final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: colorConstants._appBarBackgroundColorDark,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: colorConstants._primaryColorDark,
    ).copyWith(
      secondary: colorConstants._secondaryColorDark,
    ),
  );
}
