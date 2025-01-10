import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

class OurProductListViewItem extends StatelessWidget {
  final ProductEntity productEntity;
  const OurProductListViewItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: AppColors.backgroundItemColor,
          ),
          child: CachedNetworkImage(
            imageUrl:
                'https://pjvvvsgysihomhghsstp.supabase.co/storage/v1/object/public/products/fruits/pizza.png',
            placeholder: (context, url) => Container(
              height: 64,
              width: 64,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.backgroundItemColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'فرولة',
          style: AppStyle.fontsemi13,
        )
      ],
    );
  }
}
