import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PasswordChangedDialog extends StatelessWidget {
  const PasswordChangedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/icons/check_icon.png"),
            SizedBox(height: 12),
            Text('Password Changed!', style: AppTextStyles.h3),
            SizedBox(height: 8),
            Text(
              "Your can now use your new password to login to your account.",
              style: AppTextStyles.bodyRegularGrey,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),

            CustomButton(
              text: "Login",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
