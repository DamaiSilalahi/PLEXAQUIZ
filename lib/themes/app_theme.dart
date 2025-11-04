import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF06B6D4);
  static const Color secondaryColor = Color(0xFF3B82F6);

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}