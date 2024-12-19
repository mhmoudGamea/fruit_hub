import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      trailing: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const ShapeDecoration(
              shape: OvalBorder(),
              color: Color(0xffEEF8ED),
            ),
            child: SvgPicture.asset(
              AppImages.notification,
              // width: 22,
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
      ),
      title: Text(
        'صباح الخير !..',
        style: AppStyle.fontregular16.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      subtitle: const Text(
        'أحمد مصطفي',
        style: AppStyle.fontbold16,
      ),
      leading: Container(
        margin: const EdgeInsets.only(right: 5),
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
        ),
        child: Image.asset(
          AppImages.profile,
          width: 45,
        ),
      ),
    );
  }
}
