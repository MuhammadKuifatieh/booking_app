import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFE5E5E5);
  static const Color blackText = Color(0xFF393939);
  static const Color grayLight = Color(0xFFDFDEDE);
  static const Color grayDark = Color(0xFF616167);
  static const Color gray = Color(0xFF999999);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color peach = Color(0xFFFFB489);
  static const Color orangeGradientStart = Color(0xFFFF6161);
  static const Color orangeGradientEnd = Color(0xFFFF61DC);
  static const Color orangeDarkGradientStart = Color(0xFFFFC7A7);
  static const Color orangeDarkGradientEnd = Color(0xFFFFD579);

  static const LinearGradient mainGradent = LinearGradient(
    colors: [
      AppColors.orangeGradientStart,
      AppColors.orangeGradientEnd,
    ],
  );
}
