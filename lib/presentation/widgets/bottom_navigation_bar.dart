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
            icon: Image.asset("assets/icons/home.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/search.png"),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/saved.png"),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/cart.png"),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/account.png"),
            label: "Account",
          ),
        ],
      );
  }
}