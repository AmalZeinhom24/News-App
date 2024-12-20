import 'package:flutter/material.dart';
import 'package:news/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: mintGreen,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
    )
  );

//****************************************************************************
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
      )

  );
}
