// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_app/core/config/app_colors.dart';
import 'package:booking_app/core/config/app_text_styles.dart';
import 'package:booking_app/core/flutter_neumorphic/flutter_neumorphic.dart';

class MainTextFailed extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final double paddingWhenKeyboardIsOpened;
  final String? initialValue;
  final Function(String)? onChanged;
  final int? maxLines;
  final double titleFontSize;
  final bool enabled;

  const MainTextFailed({
    Key? key,
    this.hint,
    this.controller,
    this.validator,
    this.icon,
    this.paddingWhenKeyboardIsOpened = 20,
    this.initialValue,
    this.onChanged,
    this.maxLines,
    this.titleFontSize = 16,
    this.enabled = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          depth: -10,
          shape: NeumorphicShape.convex,
          shadowLightColor: Colors.black,
          shadowDarkColor: Colors.black,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
          color: AppColors.offWhite,
          lightSource: LightSource.bottom),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        maxLines: maxLines ?? 1,
        cursorColor: AppColors.orangeGradientStart,
        scrollPadding: EdgeInsets.only(bottom: paddingWhenKeyboardIsOpened),
        controller: controller,
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: AppTextStyles.styleWeight500(
            fontSize: titleFontSize,
          ),
          labelStyle: const TextStyle(fontSize: 20),
          filled: true,
          fillColor: Colors.transparent,
          enabled: enabled,
          prefixIcon: icon == null
              ? null
              : Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
        ),
        validator: validator,
      ),
    );
  }
}
