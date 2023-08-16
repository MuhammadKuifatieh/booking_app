import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/toast.dart';
import '../../constant/svg_paths.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/main_button.dart';
import '../widgets/main_text_failed.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = "payment_screen";
  const PaymentScreen({
    super.key,
    required this.arg,
  });
  final PaymentScreenParams arg;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Size size;
  late TextEditingController cardNumberController;
  late TextEditingController expiryController;
  late TextEditingController cvvController;
  late TextEditingController nameController;
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    cardNumberController = TextEditingController();
    expiryController = TextEditingController();
    cvvController = TextEditingController();
    nameController = TextEditingController();
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
      appBar: MainAppBar(
        size: size,
        title: "Payment",
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  SvgPaths.creditCard,
                  width: size.width,
                ),
                MainTextFailed(
                  hint: "Card Number",
                  controller: cardNumberController,
                  validator: (value) => value != null && value.isNotEmpty
                      ? null
                      : "plase add vlaue",
                ),
                Row(
                  children: [
                    Expanded(
                        child: MainTextFailed(
                      hint: "Expiry",
                      controller: expiryController,
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : "plase add vlaue",
                    )),
                    Expanded(
                        child: MainTextFailed(
                      hint: "CVV",
                      controller: cvvController,
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : "plase add vlaue",
                    )),
                  ],
                ),
                MainTextFailed(
                  hint: "Name",
                  controller: nameController,
                  validator: (value) => value != null && value.isNotEmpty
                      ? null
                      : "plase add vlaue",
                ),
                const SizedBox(height: 10),
                MainButton(
                  width: size.width * .8,
                  height: size.width * .15,
                  size: size,
                  text: "Confirm Booking",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.arg.onTapConfirm();
                    } else {
                      Toast.showText(text: "Check your data");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentScreenParams {
  final VoidCallback onTapConfirm;

  PaymentScreenParams({required this.onTapConfirm});
}
