import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/screens/auth/password_changed_dialog.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obscurePass1 = true;
  bool obscurePass2 = true;
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
            Text("Reset Password", style: AppTextStyles.h2),
            SizedBox(height: 8),
            Text(
              "Set the new password for your account so you can login and access all the features.",
              style: AppTextStyles.bodyRegularGrey,
            ),
            SizedBox(height: 16),

            CustomTextField(
              hintText: "Enter your new password",
              obscureText: obscurePass1,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePass1 = !obscurePass1;
                  });
                },
                child: obscurePass1
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              ),
            ),

            SizedBox(height: 16),
            CustomTextField(
              hintText: "Confirm new password",
              obscureText: obscurePass2,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePass2 = !obscurePass2;
                  });
                },
                child: obscurePass2
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              ),
            ),

            SizedBox(height: 24),
            CustomButton(
              text: "Continue",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => PasswordChangedDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
