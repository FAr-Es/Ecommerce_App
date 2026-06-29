import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().selectCategory(text);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
          child: Text(
            text,
            style: isSelected
                ? AppTextStyles.buttonLarge
                : AppTextStyles.bodyRegularSemiBoldBlack,
          ),
        ),
      ),
    );
  }
}
