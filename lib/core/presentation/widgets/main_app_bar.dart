import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';
import '../../constant/svg_paths.dart';
import '../../extensions/gradian.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({
    super.key,
    this.hasPop = true,
    this.centerTitle = true,
    required this.size,
    this.title,
    this.titleWidgte,
    this.bottom,
    this.height,
  }) {
    assert(!(title == null && titleWidgte == null));
    assert(!(title != null && titleWidgte != null));
  }

  final Size size;
  final bool hasPop;
  final String? title;
  final Widget? titleWidgte;
  final bool centerTitle;
  final double? height;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      title: Column(
        children: [
          SizedBox(
            height: size.height * .01,
          ),
          titleWidgte ??
              Text(
                title!,
                style:
                    AppTextStyles.styleWeight900(fontSize: size.width * .075),
              ).gradient(),
        ],
      ),
      leading: hasPop
          ? Column(
              children: [
                SizedBox(
                  height: size.height * .0125,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        SvgPaths.back,
                        width: size.width * .09,
                      ).gradient(),
                    ],
                  ),
                ),
              ],
            )
          : Container(),
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? size.height * .075);
}
