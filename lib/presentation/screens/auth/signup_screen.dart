import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:ecommerce_app/presentation/widgets/terms_text.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 59),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create account", style: AppTextStyles.h2),
            SizedBox(height: 8),
            Text(
              "Let's create your account.",
              style: AppTextStyles.bodyRegularGrey,
            ),
            SizedBox(height: 16),

            Text("Full Name", style: AppTextStyles.bodyRegularBlack),
            CustomTextField(hintText: "Enter your full name"),

            SizedBox(height: 24),

            Text("Email", style: AppTextStyles.bodyRegularBlack),
            CustomTextField(hintText: "Enter your email address"),

            SizedBox(height: 16),

            Text("Password", style: AppTextStyles.bodyRegularBlack),
            CustomTextField(
              hintText: "Enter your password",
              obscureText: obscure,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: Icon(Icons.visibility_off),
              ),
            ),

            SizedBox(height: 12),
            TermsText(),
            SizedBox(height: 24),

            CustomButton(text: "Create an Account", onTap: () {}, height: 54),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Divider()),
                Text(" Or "),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 24),
            CustomButton(
              text: "Sign Up with Google",
              widget: Image.asset("assets/logos/google.png"),
              buttonColor: AppColors.googleButtonColor,
              textButtonColor: AppColors.primaryColor,
              border: Border.all(width: 1, color: AppColors.borderColor),
              height: 56,
              onTap: () {},
            ),
            SizedBox(height: 16),
            CustomButton(
              buttonColor: AppColors.facebookButtonColor,
              text: "Sign Up with FaceBook",
              widget: Image.asset("assets/logos/facebook.png"),
              height: 56,
              onTap: () {},
            ),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: AppTextStyles.textTerms,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Log In", style: AppTextStyles.linkTerms),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
