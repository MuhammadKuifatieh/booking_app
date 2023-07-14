import 'package:booking_app/core/config/toast.dart';
import 'package:booking_app/features/main/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';
import '../../domain/usecases/register.dart';
import '../bloc/register/register_bloc.dart';

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
  late final RegisterBloc registerBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    registerBloc = RegisterBloc();
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
    return BlocProvider(
      create: (context) => registerBloc,
      child: Scaffold(
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.registerStatus == RegisterStatus.loading) {
              Toast.showLoading();
            } else if (state.registerStatus == RegisterStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "something wrong");
            } else if (state.registerStatus == RegisterStatus.succ) {
              Toast.closeAllLoading();
              Navigator.of(context).pushNamed(MainScreen.routeName);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.height * .1,
                  ),
                  Text(
                    "Register",
                    style: AppTextStyles.styleWeight900(
                      fontSize: size.width * .125,
                    ).copyWith(letterSpacing: 0),
                  ).gradient(),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  MainTextFailed(
                    hint: "Full Name",
                    controller: fullNameController,
                    validator: (text) => text == null || text.isEmpty
                        ? "fullname is short"
                        : null,
                  ),
                  // MainTextFailed(
                  //   hint: "Email",
                  //   controller: emailController,
                  // ),
                  MainTextFailed(
                    hint: "Username",
                    controller: userNameController,
                    validator: (text) => text == null || text.isEmpty
                        ? "username is short"
                        : null,
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  MainTextFailed(
                    hint: "Password",
                    controller: passwordController,
                    validator: (text) => text == null || text.length < 7
                        ? "password is short"
                        : null,
                  ),
                  MainTextFailed(
                    hint: "Confirm Password",
                    controller: confirmPasswordController,
                    validator: (text) => (text == null || text.length < 7) &&
                            text == passwordController.text
                        ? "password is short"
                        : null,
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  MainButton(
                    size: size,
                    text: "Register",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerBloc.add(
                          GetRegisterEvent(
                            RegisterParams(
                              username: userNameController.text,
                              name: fullNameController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            ),
                          ),
                        );
                      }
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
          },
        ),
      ),
    );
  }
}
