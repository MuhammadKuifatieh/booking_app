import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.size,
    required this.svgPaths,
    required this.onPressed,
    required this.selectedIndex,
  });

  final Size size;
  final int selectedIndex;
  final List<String> svgPaths;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .07,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 1,
            color: Colors.white,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: svgPaths.mapIndexed(
          (index, element) {
            return selectedIndex == index
                ? NeumorphicButton(
                    onPressed: () {
                      onPressed(index);
                    },
                    padding: const EdgeInsets.all(12),
                    style: NeumorphicStyle(
                      depth: -10,
                      shadowDarkColor: Colors.grey.shade700,
                      shadowLightColor: Colors.grey.shade200,
                      lightSource: LightSource.topLeft,
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(10),
                      ),
                      color: Colors.transparent,
                    ),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppColors.mainGradent.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: SvgPicture.asset(
                        element,
                      ),
                    ))
                : GestureDetector(
                    onTap: () {
                      onPressed(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        element,
                        color: AppColors.gray,
                      ),
                    ),
                  );
          },
        ).toList(),
      ),
    );
  }
}
