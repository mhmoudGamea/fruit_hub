import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';

class ActiveStepItem extends StatelessWidget {
  final String title;

  const ActiveStepItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: AppStyle.fontbold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
