import 'package:flutter/material.dart';

import '../../../../core/constant/svg_paths.dart';
import '../../../category/presentation/pages/category_screen.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../search/presentation/pages/search_screen.dart';
import '../widgets/main_bottom_navigator_bar.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "main_Screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Size size;
  ValueNotifier<int> index = ValueNotifier(0);
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  final pages = const [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    // NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: index,
        builder: (context, value, _) {
          return Scaffold(
            body: pages[value],
            bottomNavigationBar: MainBottomNavigationBar(
              size: size,
              selectedIndex: value,
              onPressed: (index) {
                this.index.value = index;
              },
              svgPaths: const [
                SvgPaths.home,
                SvgPaths.category,
                SvgPaths.search,
                // SvgPaths.notification,
                SvgPaths.profile,
              ],
            ),
          );
        });
  }
}
