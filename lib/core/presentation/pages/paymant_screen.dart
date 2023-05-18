import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: Column(
          children: [
            SvgPicture.asset(
              SvgPaths.creditCard,
              width: size.width,
            ),
            const MainTextFailed(
              hint: "Card Number",
            ),
            const Row(
              children: [
                Expanded(
                    child: MainTextFailed(
                  hint: "Expiry",
                )),
                Expanded(
                    child: MainTextFailed(
                  hint: "CVV",
                )),
              ],
            ),
            const MainTextFailed(
              hint: "Name",
            ),
            const SizedBox(height: 10),
            MainButton(
              width: size.width * .8,
              height: size.width * .15,
              size: size,
              text: "Confirm Booking",
              onPressed: widget.arg.onTapConfirm,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreenParams {
  final VoidCallback onTapConfirm;

  PaymentScreenParams({required this.onTapConfirm});
}
