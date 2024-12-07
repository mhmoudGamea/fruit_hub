import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../config/app_colors.dart';
import '../config/app_style.dart';

abstract class Helper {
  static successMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.darkPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.tick_square,
                color: AppColors.white,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message, style: AppStyle.fontsemi13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static errorMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
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
                child: Text(message, style: AppStyle.fontsemi13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
