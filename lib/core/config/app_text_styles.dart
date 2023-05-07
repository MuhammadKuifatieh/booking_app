import 'package:booking_app/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle styleWeight200({
    double fontSize = 12,
    Color color = AppColors.blackText,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w200,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle styleWeight300({
    double fontSize = 12,
    Color color = AppColors.blackText,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle styleWeight400({
    double fontSize = 12,
    Color color = AppColors.blackText,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle styleWeight500({
    double fontSize = 12,
    Color color = AppColors.blackText,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle styleWeight600({
    double fontSize = 12,
    Color color = AppColors.blackText,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle styleWeight700({
    double fontSize = 12,
    Color color = AppColors.blackText,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle styleWeight900({
    double fontSize = 12,
    Color color = AppColors.blackText,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }
}
