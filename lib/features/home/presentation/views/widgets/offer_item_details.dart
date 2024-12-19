import 'package:flutter/material.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import 'offer_item_button.dart';

class OfferItemDetails extends StatelessWidget {
  final String title;
  final String subTitle;
  const OfferItemDetails(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.fontregular13.copyWith(
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          subTitle,
          style: AppStyle.fontbold23.copyWith(
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 7),
        OfferItemButton(onPressed: () {}, text: 'تسوق الأن'),
      ],
    );
  }
}
