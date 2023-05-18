import 'package:booking_app/core/flutter_neumorphic/flutter_neumorphic.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.size,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
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
      child: Container(
        width: width ?? size.width * .5,
        height: height ?? size.width * .12,
        decoration: BoxDecoration(
          gradient: AppColors.mainGradent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .045,
              color: AppColors.offWhite,
            ),
          ),
        ),
      ),
    );
  }
}
