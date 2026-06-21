import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.onTap, required this.currentIndex});

  final int currentIndex;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: AppColors.backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home.png", color: currentIndex == 0 ? AppColors.primaryColor : AppColors.secondaryColor),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/search.png", color: currentIndex == 1 ? AppColors.primaryColor : AppColors.secondaryColor),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/saved.png", color: currentIndex == 2 ? AppColors.primaryColor : AppColors.secondaryColor),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/cart.png", color: currentIndex == 3 ? AppColors.primaryColor : AppColors.secondaryColor),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/account.png", color: currentIndex == 4 ? AppColors.primaryColor : AppColors.secondaryColor),
            label: "Account",
          ),
        ],
      );
  }
}