import 'package:booking_app/core/flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constant/svg_paths.dart';
import '../../../../core/presentation/widgets/network_image.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profile_screen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                depth: 1.5,
                color: AppColors.backgroundColor,
                shadowDarkColor: Colors.grey.shade700,
                shadowLightColor: Colors.grey.shade200,
                lightSource: LightSource.topLeft,
                shape: NeumorphicShape.flat,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CacheImage(
                      width: size.width * .15,
                      height: size.width * .15,
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpIoI76wjvQ2pq6t25TLmRAwTxv118OFKZxykoCiY_fWRtR8QRr1nWWcDtG3tHdgCuWu8&usqp=CAU",
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Jane Doe",
                    style: AppTextStyles.styleWeight900(
                      fontSize: size.width * .065,
                    ),
                  ),
                ],
              ),
            ),
            ProfileButton(
              size: size,
              onTap: () {},
              title: "Your Favorite",
              svgPath: SvgPaths.favorite,
            ),
            ProfileButton(
              size: size,
              title: "Payment",
              onTap: () {},
              svgPath: SvgPaths.payment,
            ),
            ProfileButton(
              size: size,
              title: "Help",
              onTap: () {},
              svgPath: SvgPaths.help,
            ),
            ProfileButton(
              size: size,
              title: "Promotions",
              onTap: () {},
              svgPath: SvgPaths.promotions,
            ),
            ProfileButton(
              size: size,
              title: "Setting",
              onTap: () {},
              svgPath: SvgPaths.setting,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.size,
    required this.title,
    required this.onTap,
    required this.svgPath,
  });

  final Size size;
  final String title;
  final String svgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: size.width * .075),
        child: Row(
          children: [
            SizedBox(
              width: size.width * .065,
            ),
            SvgPicture.asset(
              svgPath,
              width: size.width * .06,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .045,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
