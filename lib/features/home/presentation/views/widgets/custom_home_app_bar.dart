import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/app_images.dart';
import 'package:fruit_hub/core/utilies/helper.dart';
import 'package:fruit_hub/core/widgets/custom_notification_icon.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      trailing: const CustomNotificationIcon(),
      title: Text(
        'صباح الخير !..',
        style: AppStyle.fontregular16.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      subtitle: Text(
        Helper.getUserDataFromSharedPrefrences()?.name ?? 'غير معروف',
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
