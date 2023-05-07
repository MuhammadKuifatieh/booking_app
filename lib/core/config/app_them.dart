import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData getColor() {
    return ThemeData(
      fontFamily: GoogleFonts.nunito().fontFamily,
      primaryColor: AppColors.orangeGradientStart,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.orangeGradientStart,
      ),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              MaterialColor(AppColors.orangeGradientStart.value, const {
        50: AppColors.orangeGradientStart,
        100: AppColors.orangeGradientStart,
        200: AppColors.orangeGradientStart,
        300: AppColors.orangeGradientStart,
        400: AppColors.orangeGradientStart,
        500: AppColors.orangeGradientStart,
        600: AppColors.orangeGradientStart,
        700: AppColors.orangeGradientStart,
        800: AppColors.orangeGradientStart,
        900: AppColors.orangeGradientStart,
      })).copyWith(
        secondary: AppColors.orangeGradientEnd,
      ),
    );
  }
}
