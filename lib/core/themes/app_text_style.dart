import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // prevent instantiation
  AppTextStyles._();

  // ─── Headings ───────────────────────────────────────────
  static const TextStyle h1 = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
    letterSpacing: -0.5,
    height: .8,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
    letterSpacing: -0.5,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  // ─── Body ────────────────────────────────────────────────
  static const TextStyle bodyRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondaryColor,
  );

  // ─── Buttons ─────────────────────────────────────────────
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.backgroundColor,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.backgroundColor,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.backgroundColor,
    letterSpacing: 0.5,
  );

  // ─── Labels & Captions ───────────────────────────────────
  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
    letterSpacing: 0.4,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: AppColors.textHintColor,
    height: 1.3,
  );

  // ─── E-commerce Specific ─────────────────────────────────
  static const TextStyle price = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
    letterSpacing: -0.3,
  );

  static const TextStyle priceSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle priceOld = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textHintColor,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle saleBadge = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: AppColors.backgroundColor,
    letterSpacing: 0.3,
  );

  static const TextStyle productTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
    height: 1.3,
  );

  static const TextStyle productCategory = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
    letterSpacing: 0.5,
  );

  // ─── Form Fields ─────────────────────────────────────────
  static const TextStyle inputText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textHintColor,
  );

  static const TextStyle inputLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.errorColor,
  );

  // ─── Navigation ──────────────────────────────────────────
  static const TextStyle navBarLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
    letterSpacing: -0.2,
  );
}