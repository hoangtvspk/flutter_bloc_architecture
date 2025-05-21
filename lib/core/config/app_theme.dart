import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get darkTheme {
    // Get Be Vietnam Pro text theme with proper inheritance
    final baseTextTheme = GoogleFonts.beVietnamProTextTheme();

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.brownDark,
      // Inherit from base text theme and override color to white
      textTheme: baseTextTheme.copyWith(
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: Colors.white),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: Colors.white),
        bodySmall: baseTextTheme.bodySmall?.copyWith(color: Colors.white),
        titleLarge: baseTextTheme.titleLarge?.copyWith(color: Colors.white),
        titleMedium: baseTextTheme.titleMedium?.copyWith(color: Colors.white),
        titleSmall: baseTextTheme.titleSmall?.copyWith(color: Colors.white),
        displayLarge: baseTextTheme.displayLarge?.copyWith(color: Colors.white),
        displayMedium:
            baseTextTheme.displayMedium?.copyWith(color: Colors.white),
        displaySmall: baseTextTheme.displaySmall?.copyWith(color: Colors.white),
        headlineLarge:
            baseTextTheme.headlineLarge?.copyWith(color: Colors.white),
        headlineMedium:
            baseTextTheme.headlineMedium?.copyWith(color: Colors.white),
        headlineSmall:
            baseTextTheme.headlineSmall?.copyWith(color: Colors.white),
        labelLarge: baseTextTheme.labelLarge?.copyWith(color: Colors.white),
        labelMedium: baseTextTheme.labelMedium?.copyWith(color: Colors.white),
        labelSmall: baseTextTheme.labelSmall?.copyWith(color: Colors.white),
      ),
    );
  }
}
