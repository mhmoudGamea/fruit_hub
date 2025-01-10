import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    super.key,
    required this.icon,
    required this.onPress,
    required this.size,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
  });
  final IconData icon;
  final VoidCallback onPress;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: size,
        width: size,
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              width: 1.2,
              color: borderColor ?? AppColors.primaryColor,
            ),
          ),
          color: backgroundColor ?? AppColors.primaryColor,
        ),
        child: FittedBox(
            child: Icon(icon, size: 25, color: iconColor ?? AppColors.white)),
      ),
    );
  }
}
