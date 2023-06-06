import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: Colors.deepOrange.shade400,
      secondary: Colors.deepOrange.shade400,
      surface: const Color.fromRGBO(30, 32, 38, 1),
      background: const Color.fromRGBO(30, 32, 38, 1),
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      brightness: Brightness.dark,
    ).copyWith(
      secondary: Colors.deepOrange,
    ),
    brightness: Brightness.dark,
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.deepOrange.shade400,
    scaffoldBackgroundColor: const Color.fromRGBO(30, 32, 38, 1),
    primaryColorLight: Colors.white,
    primaryColorDark: const Color.fromRGBO(41, 46, 60, 1),
    shadowColor: const Color.fromRGBO(18, 18, 18, 0.5),
    primaryTextTheme: const TextTheme(),
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        bodySmall: const TextStyle(
          color: Colors.white,
        ),
        headlineMedium: const TextStyle(
          color: Colors.deepOrange,
        ),
        titleLarge: const TextStyle(
          color: Colors.white,
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade100,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade100,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange.shade400,
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.deepOrange.shade400,
        side: const BorderSide(
          color: Colors.white,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ));

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Colors.deepOrange.shade400,
    secondary: Colors.deepOrange.shade300,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ).copyWith(
    secondary: Colors.deepOrange,
  ),
  brightness: Brightness.light,
  primarySwatch: Colors.deepOrange,
  primaryColor: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  primaryColorLight: const Color.fromRGBO(41, 46, 60, 1),
  primaryColorDark: Colors.grey.shade100,
  shadowColor: Colors.grey.withOpacity(0.5),
  textTheme: GoogleFonts.poppinsTextTheme(
    TextTheme(
      bodySmall: const TextStyle(
        color: Colors.black,
      ),
      headlineMedium: const TextStyle(
        color: Colors.deepOrange,
      ),
      titleLarge: const TextStyle(
        color: Colors.black,
        fontSize: 21,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade900,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade900,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepOrange.shade400,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
