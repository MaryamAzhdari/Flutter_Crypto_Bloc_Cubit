import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static const Color backColorDark = Colors.black;
  static const Color greyColor = Color.fromARGB(255, 86, 86, 86);
  static const Color yellowColor = Color.fromARGB(255, 228, 196, 99);
  static const Color whiteColor = Colors.white;
  static const Color positiveColor = Color.fromARGB(255, 81, 255, 159);
  static const Color negativColor = Color.fromARGB(255, 251, 102, 72);
  static const Color btnColor = Color.fromARGB(255, 243, 190, 178);

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        letterSpacing: 0.2,
        fontWeight: FontWeight.bold,
        color: backColorDark,
      ),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.1,
          color: backColorDark),
      titleSmall: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w600, color: backColorDark),
      bodyMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          decoration: TextDecoration.underline,
          decorationThickness: 1,
          decorationColor: backColorDark,
          color: backColorDark),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        letterSpacing: 0.2,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.1,
          color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w600, color: whiteColor),
      bodyMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          decoration: TextDecoration.underline,
          decorationThickness: 0.7,
          decorationColor: whiteColor,
          color: whiteColor),
    ),
  );
}
