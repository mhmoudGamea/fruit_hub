import 'package:flutter/material.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../../../core/utilies/helper.dart';

class CartLengthHeader extends StatelessWidget {
  const CartLengthHeader({super.key, required this.length});
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 40,
      color: const Color(0xffEBF9F1),
      child: Text(
        Helper.getHeaderTitle(length),
        textAlign: TextAlign.center,
        style: AppStyle.fontregular13.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
