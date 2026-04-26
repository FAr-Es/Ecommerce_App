import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/screens/auth/reset_password_screen.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class VertificationCodeScreen extends StatefulWidget {
  const VertificationCodeScreen({super.key});

  @override
  State<VertificationCodeScreen> createState() =>
      _VertificationCodeScreenState();
}

class _VertificationCodeScreenState extends State<VertificationCodeScreen> {
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 59),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(height: 14),
            Text("Enter 4 Digit Code", style: AppTextStyles.h2),
            SizedBox(height: 8),
            Text(
              "Enter 4 digit code that your receive on your email.",
              style: AppTextStyles.bodyRegularGrey,
            ),
            SizedBox(height: 16),

            SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    textStyle: AppTextStyles.h2,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    controller: controllers[0],
                    focusNode: focusNodes[0],
                    onChange: (value) {
                      if (value?.length == 1) {
                        FocusScope.of(context).requestFocus(focusNodes[1]);
                      }
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    textStyle: AppTextStyles.h2,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    controller: controllers[1],
                    focusNode: focusNodes[1],
                    onChange: (value) {
                      if (value?.length == 1) {
                        FocusScope.of(context).requestFocus(focusNodes[2]);
                      }
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    textStyle: AppTextStyles.h2,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    controller: controllers[2],
                    focusNode: focusNodes[2],
                    onChange: (value) {
                      if (value?.length == 1) {
                        FocusScope.of(context).requestFocus(focusNodes[3]);
                      }
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    textStyle: AppTextStyles.h2,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    controller: controllers[3],
                    focusNode: focusNodes[3],
                    onChange: (value) {
                      if (value?.length == 1) {
                        FocusScope.of(context).unfocus(); // dismiss keyboard
                      }
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Email not received?", style: AppTextStyles.textTerms),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 3),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Resend code", style: AppTextStyles.linkTerms),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomButton(
              text: "Continue",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
