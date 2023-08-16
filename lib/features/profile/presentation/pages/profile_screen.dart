import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/global_functions.dart';
import '../../../../core/constant/svg_paths.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../customer_booking/presentation/pages/customer_booking_screen.dart';
import '../../../favorites/presentation/pages/my_favorites_screen.dart';
import '../../../owner_booking/presentation/pages/my_places_screen.dart';
import '../../../splash/presentation/pages/splash_screen.dart';

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
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqvxdjR8ZWAokr85824NMScMNQ5I9K6x7GT2WZnRTGAA&s",
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "My Profile",
                    style: AppTextStyles.styleWeight900(
                      fontSize: size.width * .065,
                    ),
                  ),
                ],
              ),
            ),
            ProfileButton(
              size: size,
              onTap: () {
                Navigator.of(context).pushNamed(MyFavoritesScreen.routeName);
              },
              title: "Your Favorite",
              svgPath: SvgPaths.favorite,
            ),
            ProfileButton(
              size: size,
              title: "My Booking",
              onTap: () {
                Navigator.of(context)
                    .pushNamed(CustomerBookingScreen.routeName);
              },
              svgPath: SvgPaths.payment,
            ),
            // ProfileButton(
            //   size: size,
            //   title: "Help",
            //   onTap: () {},
            //   svgPath: SvgPaths.help,
            // ),
            ProfileButton(
              size: size,
              title: "My Places",
              onTap: () {
                Navigator.of(context).pushNamed(MyPlacesScreen.routeName);
              },
              svgPath: SvgPaths.promotions,
            ),
            ProfileButton(
              size: size,
              title: "Logout",
              onTap: () async {
                await GlobalFunctions.logout();
                if (mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    SplashScreen.routeName,
                    (route) => false,
                  );
                }
              },
              child: Icon(
                Icons.logout_outlined,
                size: size.width * .06,
              ).gradient(),
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
    this.svgPath,
    this.child,
  });

  final Size size;
  final String title;
  final String? svgPath;
  final VoidCallback onTap;
  final Widget? child;

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
            (child != null)
                ? child!
                : SvgPicture.asset(
                    svgPath!,
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
