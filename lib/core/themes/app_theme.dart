import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6C63FF), // Modern purple
      secondary: Color(0xFF4CAF50), // Fresh green
      tertiary: Color(0xFFFF6B6B), // Coral accent
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFE53935),
    ),
    primaryColor: const Color(0xFF6C63FF),
    cardColor: const Color(0xFF2D3436),
    hintColor: const Color(0xFF6C63FF),
    disabledColor: const Color(0xFF95A5A6),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFFFF),
      iconTheme: IconThemeData(color: Color(0xFF2D3436)),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF2D3436)),
      bodyMedium: TextStyle(color: Color(0xFF2D3436)),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF2D3436),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6C63FF),
      secondary: Color(0xFF4CAF50),
      tertiary: Color(0xFFFF6B6B),
      surface: Color(0xFF1E1E1E),
      error: Color(0xFFE53935),
    ),
    primaryColor: const Color(0xFF6C63FF),
    cardColor: const Color(0xFFF8F9FA),
    hintColor: const Color(0xFF6C63FF),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1E1E1E),
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFFFFFFF)),
      bodyMedium: TextStyle(color: Color(0xFFFFFFFF)),
    ),
    disabledColor: const Color(0xFF95A5A6),
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
