import 'dart:math';

import 'package:booking_app/features/main/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/presentation/widgets/gradian_text.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late Size size;
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.height * .1,
          ),
          GradientText(
            "Register",
            style: AppTextStyles.styleWeight900(
              fontSize: size.width * .125,
            ).copyWith(letterSpacing: 0),
            gradient: AppColors.mainGradent,
          ),
          SizedBox(
            height: size.height * .05,
          ),
          MainTextFailed(
            hint: "Full Name",
            controller: fullNameController,
          ),
          MainTextFailed(
            hint: "Email",
            controller: emailController,
          ),
          MainTextFailed(
            hint: "Username",
            controller: userNameController,
          ),
          SizedBox(
            height: size.height * .01,
          ),
          MainTextFailed(
            hint: "Password",
            controller: passwordController,
          ),
          MainTextFailed(
            hint: "Confirm Password",
            controller: confirmPasswordController,
          ),
          SizedBox(
            height: size.height * .05,
          ),
          MainButton(
            size: size,
            text: "Register",
            onPressed: () {
              Navigator.of(context).pushNamed(MainScreen.routeName);
            },
          ),
          SizedBox(
            height: size.height * .025,
          ),
          MainButtonWithBorder(
            size: size,
            text: "Back",
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
