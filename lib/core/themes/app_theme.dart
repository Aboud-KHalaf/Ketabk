import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFF000000),
    hintColor: Colors.cyan, //const Color(0xFFfa4a1c),
    disabledColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFFF8F8F8),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFFFF),
      iconTheme: IconThemeData(color: Color(0xFF262626)),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF262626)),
      bodyMedium: TextStyle(color: Color(0xFF262626)),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF262626),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF000000),
    cardColor: const Color(0xFFF8F8F8),
    hintColor: Colors.cyan, // const Color(0xFFfa4a1c),
    scaffoldBackgroundColor: const Color(0xFF000000),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF000000),
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFFFFFFF)),
      bodyMedium: TextStyle(color: Color(0xFFFFFFFF)),
    ),
    disabledColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  );
}
