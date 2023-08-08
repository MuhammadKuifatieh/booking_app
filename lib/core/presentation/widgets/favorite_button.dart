import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../extensions/gradian.dart';
import '../../extensions/int.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });
  final VoidCallback onTap;
  final int isFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 17.5,
        backgroundColor: AppColors.grayLight,
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.mainGradent.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: isFavorite.toBool()
              ? const Icon(
                  Icons.favorite,
                ).gradient()
              : const Icon(
                  Icons.favorite_border,
                  color: AppColors.offWhite,
                ),
        ),
      ),
    );
  }
}
