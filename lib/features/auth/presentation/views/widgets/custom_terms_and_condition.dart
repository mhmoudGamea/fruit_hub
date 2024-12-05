import 'package:flutter/material.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import 'custom_check_box.dart';

class CustomTermsAndCondition extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  const CustomTermsAndCondition({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        const SizedBox(width: 16),
        Expanded(
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
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
