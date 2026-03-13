import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class LcarsTheme {
  static ThemeData get dark {
    final base = ThemeData.dark();
    final textTheme = GoogleFonts.antonioTextTheme(base.textTheme).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    );

    return base.copyWith(
      scaffoldBackgroundColor: LcarsColors.black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: LcarsColors.gold,
        brightness: Brightness.dark,
        primary: LcarsColors.gold,
        secondary: LcarsColors.mauve,
        surface: LcarsColors.black,
      ),
      textTheme: textTheme.copyWith(
        displayLarge: textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LcarsColors.gold,
          foregroundColor: Colors.black,
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
