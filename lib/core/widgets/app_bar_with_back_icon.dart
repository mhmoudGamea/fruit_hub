import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:go_router/go_router.dart';

class AppBarWithBackIcon extends StatelessWidget {
  const AppBarWithBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 22,
        ),
      ),
      title: const Text(
        'السلة',
        style: AppStyle.fontbold19,
        textAlign: TextAlign.center,
      ),
    );
  }
}
