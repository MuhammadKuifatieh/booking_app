import 'package:booking_app/core/enums/categories_enum.dart';
import 'package:booking_app/features/car_office/presentation/pages/car_office_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/models/car_office_model.dart';
import '../../../../core/presentation/widgets/favorite_button.dart';
import '../../../../core/presentation/widgets/network_image.dart';

class CarOfficeCard extends StatelessWidget {
  const CarOfficeCard({
    super.key,
    required this.size,
    required this.carOffice,
    this.onTap,
  });

  final Size size;
  final CarOfficeModel carOffice;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.of(context).pushNamed(
              CarOfficeDetailsScreen.routeName,
              arguments: CarOfficeDetailsScreenParams(
                carOfficeId: carOffice.id!,
                carOfficeName: carOffice.name!,
              ),
            );
          },
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
                  imageUrl: carOffice.image!.mediaUrl!,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FavoriteButton(
                    modelId: carOffice.id!,
                    modelType: CategoriesEnum.carOffice,
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
                    carOffice.name!,
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  Text(
                    carOffice.city!.name!,
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                      color: AppColors.grayLight,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      carOffice.placeContact!.address!,
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
