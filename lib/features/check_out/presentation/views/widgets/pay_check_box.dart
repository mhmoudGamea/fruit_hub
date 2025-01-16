import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';

import '../../../../../core/config/app_colors.dart';

class PayCheckBox extends StatelessWidget {
  const PayCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDDDFDF), width: 1.5),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryColor),
          child: const Icon(
            Icons.check_rounded,
            size: 20,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'جعل البطاقة افتراضية',
          style: AppStyle.fontsemi13.copyWith(color: const Color(0xff616A6B)),
        ),
      ],
    );
  }
}
