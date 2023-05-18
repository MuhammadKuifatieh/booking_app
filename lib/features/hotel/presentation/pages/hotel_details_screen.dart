import 'package:booking_app/core/config/app_colors.dart';
import 'package:booking_app/core/config/app_text_styles.dart';
import 'package:booking_app/core/constant/svg_paths.dart';
import 'package:booking_app/core/presentation/widgets/main_button.dart';
import 'package:booking_app/core/presentation/widgets/network_image.dart';
import 'package:booking_app/features/hotel/presentation/pages/room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HotelDetailsScreen extends StatefulWidget {
  static const routeName = "hotel_details_screen";
  const HotelDetailsScreen({super.key});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CacheImage(
                  width: size.width,
                  height: size.width * .6666,
                  imageUrl:
                      "https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * .075,
                      horizontal: size.width * .025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          radius: size.width * .055,
                          backgroundColor: AppColors.grayLight,
                          child: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) =>
                                AppColors.mainGradent.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                SvgPaths.back,
                                width: size.width * .05,
                                color: AppColors.offWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: size.width * .055,
                        backgroundColor: AppColors.grayLight,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) =>
                              AppColors.mainGradent.createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_border,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .05,
                vertical: size.width * .05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hotel Dence Royal",
                    style: AppTextStyles.styleWeight900(
                      fontSize: size.width * .05,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      gradient: AppColors.mainGradent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "4.8",
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: MainButton(
        size: size,
        width: size.width * .8,
        height: size.width * .15,
        text: "Select Room",
        onPressed: () {
          Navigator.of(context).pushNamed(RoomScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
