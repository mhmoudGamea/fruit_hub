import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../config/app_colors.dart';
import '../config/app_style.dart';

class CustomErrorWidget extends StatelessWidget {
  final String text;
  const CustomErrorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          const Icon(
            Iconsax.warning_2,
            color: AppColors.white,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: AppStyle.fontsemi13),
          ),
        ],
      ),
    );
  }
}
