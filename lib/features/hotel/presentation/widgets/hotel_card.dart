import 'package:booking_app/core/extensions/gradian.dart';
import 'package:booking_app/features/hotel/presentation/pages/hotel_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../../core/presentation/widgets/ratting_card.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(HotelDetailsScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CacheImage(
                  width: size.width * .9,
                  height: size.width * .6,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6TDTZSs8CSIVCgBSw2Pb3HFkREHnPOuG2w4jWXevThGVynZiTA2quQXyvj4eAIEM_FcE&usqp=CAU",
                ),
                Container(
                  width: size.width * .9,
                  height: size.width * .6,
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
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: FavoriteButton(
                          isFavorite: false,
                          onTap: () {},
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hotel Dence Royal",
                            style: AppTextStyles.styleWeight500(
                              color: AppColors.offWhite,
                              fontSize: size.width * .045,
                            ),
                          ),
                          RattingCard(
                            size: size,
                            rate: 4.8,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: size.width * .9,
              height: size.width * .275,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "San Marco, 0.1 miles from center",
                    style: AppTextStyles.styleWeight500(
                      color: AppColors.grayDark,
                      fontSize: size.width * .04,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          "Standard double room \nNo prepayment",
                          style: AppTextStyles.styleWeight500(
                            fontSize: size.width * .04,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "800000 \$",
                          style: AppTextStyles.styleWeight900(
                            fontSize: size.width * .045,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });
  final VoidCallback onTap;
  final bool isFavorite;
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
          child: isFavorite
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
