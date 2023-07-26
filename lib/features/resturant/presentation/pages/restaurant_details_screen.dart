import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constant/svg_paths.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../widgets/bookin_table_bottom_sheet.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  static const String routeName = "restaurant_details_screen";

  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.sizeOf(context);
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
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS72fXNG6-GZcAPPh2Q8YR10zaDxbV7HGbRs8m2H8_31Ro_HOoXk3RD2VX9AoK_dS63Xs&usqp=CAU",
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
        text: "Select Table Type",
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => BookingTableBottomSheet(size: size),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

