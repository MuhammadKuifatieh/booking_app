import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';

class RattingCard extends StatelessWidget {
  const RattingCard({
    super.key,
    required this.rate,
    required this.size,
  });

  final Size size;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        gradient: AppColors.mainGradent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            rate.toString(),
            style: AppTextStyles.styleWeight500(
              color: AppColors.offWhite,
              fontSize: size.width * .035,
            ),
          ),
          Icon(
            Icons.star,
            size: size.width * .04,
            color: AppColors.offWhite,
          )
        ],
      ),
    );
  }
}
