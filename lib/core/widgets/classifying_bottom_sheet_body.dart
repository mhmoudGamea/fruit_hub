import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/widgets/classify_text_field.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_range_slider.dart';
import 'package:iconsax/iconsax.dart';

class ClassifyingBottomSheetBody extends StatelessWidget {
  const ClassifyingBottomSheetBody({super.key});

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
            'تصنيف حسب :',
            style: AppStyle.fontbold19,
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Icon(Iconsax.transaction_minus, size: 16),
              SizedBox(width: 5),
              Text(
                'السعر :',
                style: AppStyle.fontbold13,
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: ClassifyTextField()),
              SizedBox(width: 10),
              Text(
                'الي',
                style: AppStyle.fontbold13,
              ),
              SizedBox(width: 10),
              Expanded(child: ClassifyTextField()),
            ],
          ),
          const SizedBox(height: 15),
          const CustomRangeSlider(),
          const SizedBox(height: 11),
          CustomButton(onPressed: () {}, data: 'تصفيه')
        ],
      ),
    );
  }
}
