import 'package:flutter/material.dart';
import 'package:news/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF02066F),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF02066F),
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
  );

//****************************************************************************
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF02066F),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF02066F),
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
