import '../../config/app_text_styles.dart';
import '../../extensions/gradian.dart';
import '../../flutter_neumorphic/flutter_neumorphic.dart';
import 'main_button.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "check internet connection",
            style: AppTextStyles.styleWeight500(
              fontSize: 22,
            ),
          ).gradient(),
          const SizedBox(height: 40),
          MainButton(
            size: size,
            text: "Try Again",
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
