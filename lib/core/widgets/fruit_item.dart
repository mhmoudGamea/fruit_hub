import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/app_images.dart';
import 'package:iconsax/iconsax.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xfff3f5f7),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    // print('object 2222222222222222');
                  },
                  child: const Icon(
                    Iconsax.heart,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                    width: 114,
                    height: 105,
                    child: SvgPicture.asset(AppImages.pineaple)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text('أناناس', style: AppStyle.fontsemi13),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '20جنية /',
                    style: AppStyle.fontbold13
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  TextSpan(
                    text: ' الكيلو',
                    style: AppStyle.fontbold13.copyWith(
                        color: AppColors.secondaryColor.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            trailing: Container(
              height: 36,
              width: 36,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.primaryColor,
              ),
              child: const Icon(Iconsax.add, size: 25, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
