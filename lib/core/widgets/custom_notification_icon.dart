import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilies/app_images.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Color(0xffEEF8ED),
          ),
          child: SvgPicture.asset(
            AppImages.notification,
          ),
        ),
        const Positioned(
          top: 11.4,
          right: 20,
          child: Icon(
            Icons.circle,
            size: 5,
            color: Colors.orange,
          ),
        )
      ],
    );
  }
}
