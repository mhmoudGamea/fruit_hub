import 'package:flutter/material.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';

class OfferItemDetailsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  const OfferItemDetailsButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.textColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 116,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyle.fontbold13
              .copyWith(color: textColor ?? AppColors.primaryColor),
        ),
      ),
    );
  }
}
