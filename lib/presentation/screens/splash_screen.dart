import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/icons/background.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Center(child: Image.asset("assets/icons/main_icon.png")),
          Positioned(
            left: 0,
            right: 0,
            bottom: 93,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.backgroundColor,
                strokeWidth: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
