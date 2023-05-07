import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';
import 'gradian_text.dart';

class MainButtonWithBorder extends StatelessWidget {
  const MainButtonWithBorder({
    super.key,
    required this.size,
    required this.text,
    required this.onPressed,
  });
  final Size size;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        depth: 10,
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
        color: Colors.transparent,
      ),
      padding: EdgeInsets.zero,
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: const BoxDecoration(
          gradient: AppColors.mainGradent,
        ),
        child: Container(
          margin: const EdgeInsets.all(1.5),
          width: size.width * .5,
          height: size.width * .12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.backgroundColor,
          ),
          child: Center(
            child: GradientText(
              text,
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .045,
                color: AppColors.backgroundColor,
              ),
              gradient: AppColors.mainGradent,
            ),
          ),
        ),
      ),
    );
  }
}
