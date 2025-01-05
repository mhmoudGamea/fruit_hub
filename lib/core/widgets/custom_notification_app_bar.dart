import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_notification_icon.dart';
import 'package:go_router/go_router.dart';

import '../config/app_style.dart';

class CustomNotificationAppBar {
  static AppBar customNotificationAppBar(context, {required String title}) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 22,
        ),
      ),
      title: Text(title, style: AppStyle.fontbold19),
      actions: const [
        CustomNotificationIcon(),
      ],
    );
  }
}
