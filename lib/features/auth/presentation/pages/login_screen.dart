import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/toast.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';
import '../../../splash/presentation/pages/splash_screen.dart';
import '../../domain/usecases/login.dart';
import '../bloc/login/login_bloc.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;
  late LoginBloc loginBloc;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    loginBloc = LoginBloc();
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
    return BlocProvider(
      create: (context) => loginBloc,
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.loginStatus == LoginStatus.loading) {
              Toast.showLoading();
            } else if (state.loginStatus == LoginStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "something wrong");
            } else if (state.loginStatus == LoginStatus.succ) {
              Toast.closeAllLoading();
              Navigator.of(context).pushNamed(SplashScreen.routeName);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
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
                    SizedBox(
                      height: size.height * .05,
                    ),
                    MainButton(
                      size: size,
                      text: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginBloc.add(
                            GetLoginEvent(
                              LoginParams(
                                username: userNameController.text,
                                password: passwordController.text,
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
                      text: "Register",
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RegisterScreen.routeName,
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
