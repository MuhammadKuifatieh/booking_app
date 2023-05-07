import 'package:booking_app/core/config/app_colors.dart';
import 'package:booking_app/core/config/app_text_styles.dart';
import 'package:booking_app/core/presentation/widgets/gradian_text.dart';
import 'package:booking_app/core/presentation/widgets/network_image.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = "category_screen";
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: GradientText(
          "",
          gradient: AppColors.mainGradent,
          style: AppTextStyles.styleWeight900(fontSize: size.width * .075),
        ),
        leading: Container(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CacheImage(
                width: size.width * .9,
                height: size.width * .5,
                borderRadius: BorderRadius.circular(25),
                imageUrl:
                    "https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=",
              ),
            )
          ],
        ),
      ),
    );
  }
}
