import 'package:flutter/material.dart';

class AppTheme {
  static lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white, backgroundColor: Colors.black87),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
      ),
      primaryColor: Colors.lightBlueAccent,
    );
  }

  static darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
    );
  }
}
