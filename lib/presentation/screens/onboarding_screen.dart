import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 47 + 12, left: 24),
              child: Text(
                "Define yourself in your unique way.",
                style: AppTextStyles.h1,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 80,
              child: Image.asset(
                "assets/icons/onboarding_background1.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 70,
              child: Image.asset(
                "assets/icons/onboarding_background2.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: AppColors.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 22,
                    bottom: 30,
                  ),
                  child: CustomButton(
                    text: " Get Started  ➜",

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    height: 54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
