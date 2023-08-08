import 'package:booking_app/core/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';

class OnBorderWidget extends StatelessWidget {
  const OnBorderWidget({
    Key? key,
    required this.title,
    this.body,
    this.imagePath,
  }) : super(key: key);
  final String title;
  final String? body;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        if (imagePath != null) ...[
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              AppColors.backgroundColor,
              BlendMode.multiply,
            ),
            child: Image.asset(
              imagePath!,
              height: size.width * .6,
              fit: BoxFit.contain,
            ),
          ),
        ],
        SizedBox(
          height: size.width * .175,
        ),
        Text(
          title,
          style: AppTextStyles.styleWeight900(
            fontSize: size.width * .075,
          ),
          textAlign: TextAlign.center,
        ).gradient(),
        if (body != null) ...[
          SizedBox(
            height: size.width * .1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              body!,
              style: AppTextStyles.styleWeight500(
                color: Colors.grey,
                fontSize: size.width * .045,
              ).copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ).gradient(),
          ),
        ]
      ],
    );
  }
}
