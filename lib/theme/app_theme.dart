import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(color: primaryColor, elevation: 5),
      scaffoldBackgroundColor: Colors.grey[300],
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor, elevation: 5));
}
