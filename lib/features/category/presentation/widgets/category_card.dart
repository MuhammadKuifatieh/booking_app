import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../pages/category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.size,
    required this.onTap,
    required this.category,
  });

  final Size size;
  final VoidCallback onTap;
  final CategoryClass category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: size.width * .05),
        child: Stack(
          children: [
            Center(
              child: CacheImage(
                width: size.width * .9,
                height: size.width * .5,
                borderRadius: BorderRadius.circular(25),
                imageUrl: category.image,
              ),
            ),
            Center(
              child: Container(
                width: size.width * .9,
                height: size.width * .5,
                padding: EdgeInsets.all(size.width * .025),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.orangeGradientStart.withOpacity(.15),
                        AppColors.orangeGradientEnd.withOpacity(.15),
                        Colors.transparent,
                      ],
                      stops: const [.2, .4, .8],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    category.name,
                    style: AppTextStyles.styleWeight900(
                      color: Colors.white,
                      fontSize: size.width * .06,
                    ).copyWith(
                      shadows: [
                        const Shadow(
                          color: Colors.black,
                          blurRadius: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
