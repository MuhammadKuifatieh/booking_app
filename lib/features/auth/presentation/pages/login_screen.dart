import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';
import '../../../main/presentation/pages/main_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
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
            height: size.height * .15,
          ),
          Text(
            "Login",
            style: AppTextStyles.styleWeight900(
              fontSize: size.width * .125,
            ).copyWith(letterSpacing: 0),
          ).gradient(),
          SizedBox(
            height: size.height * .05,
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
          SizedBox(
            height: size.height * .05,
          ),
          MainButton(
            size: size,
            text: "Login",
            onPressed: () {
              Navigator.of(context).pushNamed(MainScreen.routeName);
            },
          ),
          SizedBox(
            height: size.height * .025,
          ),
          MainButtonWithBorder(
            size: size,
            text: "Register",
            onPressed: () {
              Navigator.of(context).pushNamed(
                RegisterScreen.routeName,
              );
            },
          )
        ],
      ),
    );
  }
}
