import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF06B6D4);
  static const Color secondaryColor = Color(0xFF3B82F6);
  static const Color darkBlue = Color(0xFF0F4BA5);
  static const Color backgroundColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),

    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: backgroundColor,
    ),

    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.poppins(
        color: Colors.grey.shade500,
        fontSize: 14,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      prefixIconColor: primaryColor,
    ),
  );

  static TextStyle titleText = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.black87,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle poppinsRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static TextStyle poppinsBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );
}
