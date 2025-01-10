import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/utilies/helper.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/config/app_style.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 2),
            blurRadius: 9,
            spreadRadius: 3,
          ),
        ],
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: () {
              print('object');
            },
            child: const Icon(
              Iconsax.search_normal_1,
              color: AppColors.primaryColor,
            ),
          ),
          hintText: 'ابحث عن.......',
          hintStyle: AppStyle.fontregular13.copyWith(
            color: const Color(0xff949D9E),
          ),
          suffixIcon: InkWell(
            onTap: () {
              Helper.showClassifyingBottomModelSheet(context);
            },
            child: const Icon(
              Iconsax.setting_4,
              color: Color(0xff949D9E),
            ),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
