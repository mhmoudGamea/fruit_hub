import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_style.dart';

abstract class CustomAppBar {
  /// appbar that used in authView only
  static AppBar customAuthAppBar(context, {required String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: AppStyle.fontbold19),
      leading: InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 22,
        ),
      ),
    );
  }
}
/*
Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: const Color(0xffF1F1F5), width: 1),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
          ),
        )

*/