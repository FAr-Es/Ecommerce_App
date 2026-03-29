import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.textStyle,
    required this.onTap,
    this.buttonColor,
    this.height,
    this.textButtonColor,
    this.border,
    this.radius,
    this.widget,
  });

  final String text;
  final TextStyle? textStyle;
  final void Function() onTap;
  final Color? buttonColor;
  final Color? textButtonColor;
  final double? height;
  final BoxBorder? border;
  final double? radius;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height ?? 48,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: buttonColor ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ?widget,
              Text(
                text,
                style: (textStyle ?? AppTextStyles.buttonLarge).copyWith(
                  color: textButtonColor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
