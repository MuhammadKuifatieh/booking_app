import 'package:booking_app/core/config/app_colors.dart';
import 'package:flutter/material.dart';

extension Extension on Widget {
  gradient({Gradient gradient = AppColors.mainGradent}) => ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: this,
      );
}
