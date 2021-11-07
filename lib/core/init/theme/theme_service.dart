import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeService {
  static ThemeService instance = ThemeService._();

  ThemeService._();
  List<Color> randomColors = [
    Color(0xFF283593),
    Color(0xFFF9A825),
    Color(0xFFC62828),
    Color(0xFFFF8F00),
    Color(0xFF37474F),
    Color(0xFFEF6C00),
    Color(0xFFD84315),
    Color(0xFF4527A0),
    Color(0xFF1565C0),
    Color(0xFF0277BD),
    Color(0xFF9E9D24),
    Color(0xFF558B2F),
    Color(0xFF2E7D32),
    Color(0xFF00838F),
    Color(0xFF00695C),
    Color(0xFFAD1457),
    Color(0xFF4E342E),
    Color(0xFF6A1B9A),
    Color(0xFF424242),
  ];


  Color getRandomColor(int index) {
    try {
      return randomColors[
      index % (ThemeService.instance.randomColors.length - 1)];
    } catch (exception) {
      return randomColors[0];
    }
  }

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),
      bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),
    ),
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
    cardColor: Color(0xFF242526),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      shadowColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Color(0xFF191919),
    shadowColor: Colors.transparent,
    accentColor: Colors.blue,
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white
      ),
      bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF242526),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      selectedItemColor: Colors.white,
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
