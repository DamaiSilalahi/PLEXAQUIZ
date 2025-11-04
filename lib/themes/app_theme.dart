import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF06B6D4);
  static const Color secondaryColor = Color(0xFF3B82F6);

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
    ),
  );
}
