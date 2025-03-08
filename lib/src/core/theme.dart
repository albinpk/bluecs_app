import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData dark() {
    final buttonShape = WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
    return ThemeData.dark().copyWith(
      primaryColor: Colors.red,
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff0ca8d4),
        secondary: Color(0xff0ca8d4),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xff171f28),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff172229)),
      cardTheme: const CardThemeData(
        color: Color(0xff1f2935),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: const DividerThemeData(color: Colors.grey),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(shape: buttonShape),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(shape: buttonShape),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: buttonShape,
          foregroundColor: WidgetStateColor.resolveWith(
            (states) => Colors.white,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
