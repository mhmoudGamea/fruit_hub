import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/config/app_colors.dart';

class ActiveBottomBarIcon extends StatelessWidget {
  final String iconPath;
  final String iconName;
  const ActiveBottomBarIcon(
      {super.key, required this.iconPath, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Color(0xfff3f5f7),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 38,
            padding: const EdgeInsets.all(8),
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: AppColors.primaryColor,
            ),
            child: SvgPicture.asset(iconPath),
          ),
          const SizedBox(width: 10),
          Text(
            iconName,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
