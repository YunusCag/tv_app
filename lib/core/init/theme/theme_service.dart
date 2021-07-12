import 'package:flutter/material.dart';

class ThemeService {
  static ThemeService instance = ThemeService._();

  ThemeService._();

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF00276F),
      ),
      selectedItemColor: Color(0xFF00276F),
      unselectedLabelStyle: TextStyle(
        color: Color(0xFF999999),
        fontWeight: FontWeight.w600,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFF999999),
      ),
    ),
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF000000),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF00276F),
      ),
      selectedItemColor: Color(0xFF00276F),
      unselectedLabelStyle: TextStyle(
        color: Color(0xFF999999),
        fontWeight: FontWeight.w600,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFF999999),
      ),
    ),
  );
}
