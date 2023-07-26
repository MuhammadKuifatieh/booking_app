import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../../core/presentation/widgets/ratting_card.dart';
import '../../../hotel/presentation/widgets/hotel_card.dart';

class TripScreen extends StatefulWidget {
  static const routeName = "trip_screen";
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        size: size,
        title: "Trips",
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ClinicCard(size: size, onTap: () {});
      }),
    );
  }
}

class ClinicCard extends StatelessWidget {
  const ClinicCard({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final VoidCallback onTap;

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
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOsoDsxB8SGBdq139EZT5GNfS27RZemut-Lg&usqp=CAU",
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FavoriteButton(
                    onTap: () {},
                    isFavorite: true,
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: RattingCard(
                    rate: 4.8,
                    size: size,
                  ),
                )
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
                    "Booking car",
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  Text(
                    "test1",
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "data data data data" * 5,
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
