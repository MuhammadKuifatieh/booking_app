import 'package:booking_app/core/config/app_colors.dart';
import 'package:booking_app/core/config/app_text_styles.dart';
import 'package:booking_app/core/constant/svg_paths.dart';
import 'package:booking_app/core/presentation/widgets/gradian_text.dart';
import 'package:booking_app/core/presentation/widgets/main_button.dart';
import 'package:booking_app/core/presentation/widgets/main_text_failed.dart';
import 'package:booking_app/core/presentation/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search_screen";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Size size;
  late TextEditingController searchContoller;

  @override
  void initState() {
    searchContoller = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.width * .05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: MainTextFailed(
                hint: "search",
                icon: Icons.search,
                controller: searchContoller,
              ),
            ),
            SizedBox(height: size.width * .05),
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                color: AppColors.backgroundColor,
                margin: const EdgeInsets.symmetric(vertical: 1),
                child: Padding(
                  padding: const EdgeInsets.all(12.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (_) => NewWidget(
                              size: size,
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              SvgPaths.filter,
                              width: size.width * .055,
                            ),
                            const SizedBox(width: 7.5),
                            Text(
                              "Filter",
                              style: AppTextStyles.styleWeight500(
                                fontSize: size.width * .04,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: GradientText(
                          "Map",
                          gradient: AppColors.mainGradent,
                          style: AppTextStyles.styleWeight500(
                            fontSize: size.width * .05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 40,
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemBuilder: (context, index) {
                  return SearchItem(size: size);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: size.width * .1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .025),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                        color: AppColors.blackText,
                        size: size.width * .075,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Filter",
                        style: AppTextStyles.styleWeight900(
                            fontSize: size.width * .045),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                NeumorphicButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: NeumorphicStyle(
                    color: AppColors.backgroundColor,
                    depth: 10,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
                  ),
                  child: Text(
                    "RESET",
                    style: AppTextStyles.styleWeight500(
                        fontSize: size.width * .04),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.width * .025),
          Container(
            height: 1,
            color: Colors.white,
          ),
          SizedBox(height: size.width * .02),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
          MainButton(
            size: size,
            text: "Apply",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: size.width * .05),
        ],
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=",
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
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: AppColors.grayLight,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) =>
                              AppColors.mainGradent.createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: AppColors.offWhite,
                          ),
                        ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
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
    );
  }
}
