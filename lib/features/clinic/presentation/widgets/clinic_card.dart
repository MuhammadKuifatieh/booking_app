import 'package:booking_app/core/enums/categories_enum.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/models/clinic_model.dart';
import '../../../../core/presentation/widgets/favorite_button.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../pages/clicnic_detailes_screen.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({
    super.key,
    this.inHome = false,
    required this.size,
    required this.clinic,
  });

  final Size size;
  final bool inHome;
  final ClinicModel clinic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ClinicDetailsScreen.routeName,
            arguments: ClinicDetailsScreenParams(
              clinicId: clinic.id!,
            ));
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
                  borderRadius: BorderRadius.horizontal(
                    left: const Radius.circular(25),
                    right: inHome ? const Radius.circular(25) : Radius.zero,
                  ),
                  imageUrl: clinic.image!.mediaUrl!,
                ),
                if (inHome)
                  Container(
                    width: size.width * .45,
                    height: size.width * .45,
                    padding: EdgeInsets.all(size.width * .025),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.orangeGradientStart.withOpacity(.15),
                          AppColors.orangeGradientEnd.withOpacity(.15),
                          Colors.transparent,
                        ],
                        stops: const [.1, .25, .4],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom:
                            inHome ? const Radius.circular(25) : Radius.zero,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FavoriteButton(
                    modelId: clinic.id!,
                    modelType: CategoriesEnum.clinic,
                  ),
                ),
                if (inHome)
                  Positioned(
                    bottom: 5,
                    left: 10,
                    child: Text(
                      clinic.name!,
                      style: AppTextStyles.styleWeight500(
                        color: AppColors.offWhite,
                        fontSize: size.width * .045,
                      ),
                    ),
                  )
              ],
            ),
            if (!inHome)
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
