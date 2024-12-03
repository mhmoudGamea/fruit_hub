import 'package:flutter/material.dart';

abstract class AppStyle {
  // app fonts
  static const cairoFont = 'cairo';
  // font 13
  static const font13regular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xff4E5556),
  );
  static const font13semi = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color(0xff4E5556),
  );
  static const font13bold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: Color(0xff4E5556),
  );
  // font 16
  static const font16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  // font 19
  static const font19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
  );
  // font 23
  static const font23 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}
