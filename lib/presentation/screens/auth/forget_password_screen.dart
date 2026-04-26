import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/screens/auth/vertification_code_screen.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 59),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(height: 14),
            Text("Forget Password", style: AppTextStyles.h2),
            SizedBox(height: 8),
            Text(
              "Enter your email for the verification process.\nWe will send 4 digits code to your email.",
              style: AppTextStyles.bodyRegularGrey,
            ),
            SizedBox(height: 16),

            Text("Email", style: AppTextStyles.bodyRegularBlack),
            CustomTextField(hintText: "Enter your email address"),

            SizedBox(height: 24),

            CustomButton(text: "Send Code", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VertificationCodeScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
