import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onSaved,
    this.onChange,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.hintColor,
    this.fillColor,
    this.borderColor,
    this.isFilled = true,
  });

  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Color? fillColor;
  final Color? borderColor;
  final bool? isFilled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      onChanged: onChange,
      validator: validator,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        labelText: labelText,
        filled: isFilled,
        fillColor: fillColor ?? AppColors.backgroundColor,
        prefixIcon: prefixIcon,
        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return AppColors.errorColor;
          }
          if (states.contains(WidgetState.focused)) {
            return AppColors.primaryColor;
          }
          return AppColors.textHintColor; 
        }),

        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppTextStyles.inputHint,

        enabledBorder: _buildBorder(AppColors.borderColor),
        focusedBorder: _buildBorder(AppColors.primaryColor),
        errorBorder: _buildBorder(AppColors.errorColor),
        focusedErrorBorder: _buildBorder(AppColors.errorColor),
        border: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? AppColors.borderColor, width: 1),
    );
  }
}