import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({super.key, required this.isSelected, required this.size, required this.onTap});
  final bool isSelected;
  final String size;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 47.08,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.backgroundColor,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            size,
            style: isSelected ? AppTextStyles.h4Second : AppTextStyles.h4,
          ),
        ),
      ),
    );
  }
}
