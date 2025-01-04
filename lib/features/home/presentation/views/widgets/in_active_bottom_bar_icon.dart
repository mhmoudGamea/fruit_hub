import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InActiveBottomBarIcon extends StatelessWidget {
  final String iconPath;
  const InActiveBottomBarIcon({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath, width: 22);
  }
}
