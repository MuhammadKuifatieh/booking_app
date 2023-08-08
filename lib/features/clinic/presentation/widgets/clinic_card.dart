import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/models/clinic_model.dart';
import '../../../../core/presentation/widgets/favorite_button.dart';
import '../../../../core/presentation/widgets/network_image.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({
    super.key,
    required this.size,
    required this.onTap,
    required this.clinic,
  });

  final Size size;
  final VoidCallback onTap;
  final ClinicModel clinic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: size.width * .05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CacheImage(
                  width: size.width * .45,
                  height: size.width * .45,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(25),
                  ),
                  imageUrl: clinic.image!.mediaUrl!,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FavoriteButton(
                    onTap: () {},
                    isFavorite: clinic.isFavorite!,
                  ),
                ),
              ],
            ),
            Container(
              width: size.width * .45,
              height: size.width * .45,
              padding: EdgeInsets.only(
                left: size.width * .025,
                right: size.width * .025,
                top: size.width * .05,
                bottom: size.width * .05,
              ),
              decoration: const BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    clinic.name!,
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  Text(
                    clinic.clinicSpecialization!.name!,
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                      color: AppColors.grayDark,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      clinic.placeContact!.address!,
                      style: AppTextStyles.styleWeight500(
                        fontSize: size.width * .04,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
