import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/widgets/custom_circular_icon.dart';
import 'package:iconsax/iconsax.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity productEntity;
  const FruitItem({super.key, required this.productEntity});

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
                child: CachedNetworkImage(
                  imageUrl: productEntity.imageUrl,
                  height: 100,
                  width: 100,
                  placeholder: (context, url) {
                    return Container(
                      color: const Color.fromARGB(255, 234, 237, 239),
                      height: 100,
                      width: 100,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(productEntity.productName, style: AppStyle.fontsemi13),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${productEntity.productPrice}جنية /',
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
            trailing: CustomCircularIcon(
              icon: Iconsax.add,
              onPress: () {},
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}
