import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/global_functions.dart';
import '../../../auth/presentation/pages/login_screen.dart';

class OnBorderButtons extends StatefulWidget {
  const OnBorderButtons({
    Key? key,
    required this.pageNumber,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;
  final ValueNotifier<int> pageNumber;

  @override
  State<OnBorderButtons> createState() => _OnBorderButtonsState();
}

class _OnBorderButtonsState extends State<OnBorderButtons> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder<int>(
      valueListenable: widget.pageNumber,
      builder: (__, number, _) {
        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () async {
                  if (number > 0) {
                    for (double i = double.parse(number.toString());
                        i >= number - 1;
                        i = i - .075) {
                      // log((392.72 * i).toString());
                      await widget.pageController.animateTo(
                        (392.72 * i),
                        duration: const Duration(microseconds: 1000),
                        curve: Curves.linear,
                      );
                    }
                    widget.pageNumber.value = number - 1;
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: number == 0 ? 0 : size.width * .25,
                  height: size.width * .125,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(25)),
                    color: AppColors.gray,
                  ),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 50),
                      style: AppTextStyles.styleWeight500(
                        color: number > 0.99
                            ? AppColors.offWhite
                            : Colors.transparent,
                        fontSize: size.width * .04,
                      ),
                      child: const Text(
                        "Back",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (number == 2) {
                    await GlobalFunctions.setShowOnBoarder();
                    if (!mounted) return;
                    Navigator.of(context).pushNamed(
                      LoginScreen.routeName,
                    );
                  }
                  if (number < 2) {
                    for (double i = double.parse(number.toString());
                        i <= number + 1;
                        i = i + .075) {
                      await widget.pageController.animateTo(
                        (395 * i),
                        duration: const Duration(microseconds: 1000),
                        curve: Curves.linear,
                      );
                    }
                    widget.pageNumber.value = number + 1;
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width:
                      number.round() == 0 ? size.width * .5 : size.width * .25,
                  height: size.width * .125,
                  decoration: BoxDecoration(
                      borderRadius: number.round() == 0
                          ? BorderRadius.circular(25)
                          : const BorderRadius.horizontal(
                              right: Radius.circular(25)),
                      gradient: AppColors.mainGradent),
                  child: Center(
                    child: Text(
                      "Next",
                      style: AppTextStyles.styleWeight500(
                        color: Colors.white,
                        fontSize: size.width * .04,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
