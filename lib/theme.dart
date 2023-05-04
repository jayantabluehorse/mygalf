import 'package:flutter/material.dart';

class GalfTheme {
  static const TextStyle _galfFont = TextStyle(fontFamily: "Rubik");
  static const Color _lightPrimaryColor = Color(0xFF1A3E4E);
  static const Color _lightSecondaryColor = Color(0xFF2F7FDC);
  static const Color _lightSecondaryVariantColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      toolbarHeight: 115,
      elevation: 0,
    ),
  );

  static final TextTheme _lightTextTheme =
      TextTheme(headline1: _lighth1, headline2: _lighth2, headline3: _lighth3);

  static final TextStyle _lighth1 = TextStyle(
      fontSize: 45,
      color: _lightPrimaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: _galfFont.toString());

  static final TextStyle _lighth2 = TextStyle(
      fontSize: 30,
      color: _lightPrimaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: _galfFont.toString());
  static final TextStyle _lighth3 = TextStyle(
    fontSize: 45,
    color: _lightSecondaryVariantColor,
    fontWeight: FontWeight.bold,
    fontFamily: _galfFont.toString(),
  );
}
