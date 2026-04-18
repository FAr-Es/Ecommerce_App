import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: -30,
      spacing: -5,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "By signing up you agree to our ",
                style: AppTextStyles.textTerms,
              ),
              TextSpan(
                text: "Terms, ",
                style: AppTextStyles.linkTerms,
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                text: "Privacy Policy, ",
                style: AppTextStyles.linkTerms,
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(text: "and ", style: AppTextStyles.textTerms),
              TextSpan(
                text: "Cookie Use",
                style: AppTextStyles.linkTerms,
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
