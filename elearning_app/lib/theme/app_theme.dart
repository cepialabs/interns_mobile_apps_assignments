import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xFFF8FAFC),

    // Primary color
    primaryColor: const Color(0xFF2F6FED),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2F6FED),
      primary: const Color(0xFF2F6FED),
    ),

    // Text theme
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
      bodyMedium: TextStyle(color: Color(0xFF64748B)),
    ),

    // Input fields
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2F6FED)),
      ),
    ),

    // Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2F6FED),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
