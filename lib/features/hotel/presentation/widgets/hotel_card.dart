import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/presentation/widgets/favorite_button.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../pages/hotel_details_screen.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.size,
    required this.hotel,
  });

  final Size size;
  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          HotelDetailsScreen.routeName,
          arguments: HotelDetailsScreenParams(hotelId: hotel.id!),
        );
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
                  imageUrl: hotel.image!.mediaUrl!,
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
                          isFavorite: hotel.isFavorite!,
                          onTap: () {},
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel.name!,
                            style: AppTextStyles.styleWeight500(
                              color: AppColors.offWhite,
                              fontSize: size.width * .045,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: size.width * .9,
              height: size.width * .25,
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
                    hotel.city!.name!,
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
                          hotel.placeContact!.address!,
                          style: AppTextStyles.styleWeight500(
                            fontSize: size.width * .04,
                          ),
                          maxLines: 2,
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
