import 'package:booking_app/core/constant/images_paths.dart';
import 'package:booking_app/features/splash/presentation/widgets/on_border_buttons.dart';
import 'package:booking_app/features/splash/presentation/widgets/on_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/config/app_colors.dart';

class OnBoarderScreen extends StatefulWidget {
  static const String routeName = "on_boarder_screen";
  const OnBoarderScreen({super.key});

  @override
  State<OnBoarderScreen> createState() => _OnBoarderScreenState();
}

class _OnBoarderScreenState extends State<OnBoarderScreen> {
  final ValueNotifier<int> pageNumber = ValueNotifier(0);
  final PageController pageController = PageController();
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height * .2),
          SizedBox(
            height: size.height * .475,
            child: PageView(
              controller: pageController,
              children: const [
                OnBorderWidget(
                  title: "Chose your destination",
                  imagePath: ImagesPaths.location,
                ),
                OnBorderWidget(
                  title: "Select date & time",
                  imagePath: ImagesPaths.calendar,
                ),
                OnBorderWidget(
                  title: "  Book with us",
                  body:
                      "Our application makes it easy for you and helps you book the basic services you need, whether you are coming from outside Syria or you are in it.",
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: size.width * .0225,
              dotWidth: size.width * .0225,
              dotColor: AppColors.gray,
              activeDotColor: AppColors.orangeGradientStart,
            ),
          ),
          SizedBox(height: size.height * .1),
          OnBorderButtons(
            pageNumber: pageNumber,
            pageController: pageController,
          )
        ],
      ),
    );
  }
}
