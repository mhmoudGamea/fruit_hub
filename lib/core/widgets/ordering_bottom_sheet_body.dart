import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../config/app_style.dart';
import 'custom_button.dart';

class OrderingBottomSheetBody extends StatelessWidget {
  const OrderingBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 60,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xff131F46),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'ترتيب حسب :',
            style: AppStyle.fontbold19,
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Icon(Iconsax.record, size: 16),
              SizedBox(width: 5),
              Text(
                'السعر ( الأقل الي الأعلي )',
                style: AppStyle.fontbold13,
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Icon(Iconsax.record, size: 16),
              SizedBox(width: 5),
              Text(
                'السعر ( الأعلي الي الأقل )',
                style: AppStyle.fontbold13,
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Icon(Iconsax.record, size: 16),
              SizedBox(width: 5),
              Text(
                'الأبجديه',
                style: AppStyle.fontbold13,
              ),
            ],
          ),
          const SizedBox(height: 11),
          CustomButton(onPressed: () {}, data: 'تصفيه')
        ],
      ),
    );
  }
}
