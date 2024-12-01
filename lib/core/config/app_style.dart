import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyle {
  // app fonts
  static const cairoFont = 'cairo';
  // button fonts
  static const font16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: cairoFont,
    color: AppColors.white,
  );
}
