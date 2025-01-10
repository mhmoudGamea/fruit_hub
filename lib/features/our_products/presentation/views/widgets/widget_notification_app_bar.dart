import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_style.dart';
import '../../../../../core/widgets/custom_notification_icon.dart';

class WidgetNotificationAppBar extends StatelessWidget {
  final bool shoeIconBack;
  const WidgetNotificationAppBar({super.key, this.shoeIconBack = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      trailing: const CustomNotificationIcon(),
      title: const Text(
        'المنتجات',
        style: AppStyle.fontbold19,
        textAlign: TextAlign.center,
      ),
      leading: shoeIconBack
          ? InkWell(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 22,
              ),
            )
          : null,
    );
  }
}
