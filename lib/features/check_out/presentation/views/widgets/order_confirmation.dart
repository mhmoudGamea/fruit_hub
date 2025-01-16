import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/utilies/app_images.dart';
import 'pay_methods.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 88,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.backgroundItemColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'وسيلة الدفع',
                    style: AppStyle.fontbold13,
                  ),
                  const SizedBox(height: 13),
                  Text(
                    '6522 **** **** ****',
                    style: AppStyle.fontregular16
                        .copyWith(color: const Color(0xff4E5556)),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 13),
                  const PayMethosItem(
                    image: AppImages.visa,
                    bgColor: Color(0xff1434CB),
                    height: 30,
                    width: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
