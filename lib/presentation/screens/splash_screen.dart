import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
        Image.asset("assets/icons/background.png", fit: BoxFit.cover, width: double.infinity,),
        Center(child: Image.asset("assets/icons/main_icon.png",)),
        Positioned(
          left: 0,
          right: 0,
          bottom: 93,
          child: Center(child: CircularProgressIndicator(
            color: AppColors.backgroundColor,
            strokeWidth: 5,
          )),)
        
        
        ]),
    );
  }
}
