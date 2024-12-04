import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xff1B5E37);
  static Color lightPrimaryColor = const Color(0xff1B5E37).withOpacity(0.5);
  static Color darkPrimaryColor = const Color(0xff1B5E37).withOpacity(0.8);
  static const Color secondaryColor = Color(0xffF4A91F);
  static const Color white = Color(0xffFFFFFF);
  static const Color dark = Color(0xff000000);

  /// this is used for subtitle ex: subtitle in onBoarding
  static const Color subtitleColor = Color(0xff4E5556);

  /// color of hint in textFormField
  static const Color hintInputTextColor = Color(0xff949D9E);

  /// color of fill in textFormField
  static const Color fillInputTextColor = Color(0xffF9FAFA);

  /// color of border in textFormField
  static const Color borderInputTextColor = Color(0xffE6E9EA);
}
