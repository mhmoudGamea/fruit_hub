import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';

class AddressConfirmation extends StatelessWidget {
  const AddressConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.backgroundItemColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'عنوان التوصيل',
                style: AppStyle.fontbold13,
              ),
              const SizedBox(height: 13),
              Row(
                children: [
                  const Icon(Icons.edit_rounded,
                      size: 15, color: Color(0xff6C7275)),
                  const SizedBox(width: 8),
                  Text(
                    'تعديل',
                    style: AppStyle.fontsemi13
                        .copyWith(color: const Color(0xff6c7275)),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Iconsax.location,
                size: 20,
                color: Color(0xff4E5556),
              ),
              const SizedBox(width: 5),
              Text(
                'شارع النيل، مبنى رقم ١٢٣',
                style: AppStyle.fontregular16
                    .copyWith(color: const Color(0xff4E5556)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
