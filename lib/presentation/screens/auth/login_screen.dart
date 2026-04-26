import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/screens/auth/forget_password_screen.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
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
            Text("Login to your account", style: AppTextStyles.h2),
            SizedBox(height: 8),
            Text(
              "It's great to see you again",
              style: AppTextStyles.bodyRegularGrey,
            ),
            SizedBox(height: 16),

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
                child: obscure
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              ),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Forget your password?", style: AppTextStyles.textTerms),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(
                      left: 3,
                    ), // Removes internal padding
                    minimumSize: Size.zero, // Removes default min width/height
                    tapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // Removes extra margin around the button
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Reset your password",
                      style: AppTextStyles.linkTerms,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            CustomButton(text: "Login", onTap: () {}, height: 54),
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
              text: "Login with Google",
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
              text: "Login with FaceBook",
              widget: Image.asset("assets/logos/facebook.png"),
              height: 56,
              onTap: () {},
            ),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: AppTextStyles.textTerms),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 3),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Join", style: AppTextStyles.linkTerms),
                ),
              ],
            ),
            SizedBox(height: 37),
          ],
        ),
      ),
    );
  }
}
