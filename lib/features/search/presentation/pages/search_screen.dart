import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constant/svg_paths.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';
import '../../../hotel/presentation/widgets/hotel_card.dart';

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
                        child: Text(
                          "Map",
                          style: AppTextStyles.styleWeight500(
                            fontSize: size.width * .05,
                          ),
                        ).gradient(),
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
                  return HotelCard(size: size);
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
          const Expanded(
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

