import 'package:flutter/material.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';

class CustomAccountPrompt extends StatelessWidget {
  final VoidCallback onPressed;
  final String firstTitle;
  final String secondTitle;
  const CustomAccountPrompt({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: firstTitle,
              style: AppStyle.fontsemi16.copyWith(
                color: const Color(0xff616A6B),
              ),
            ),
            TextSpan(
              text: secondTitle,
              style: AppStyle.fontsemi16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
