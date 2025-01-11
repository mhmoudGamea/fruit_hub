import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/widgets/custom_circular_icon.dart';
import 'package:fruit_hub/features/cart/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:iconsax/iconsax.dart';

import '../../../domain/entity/cart_entity.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem(
      {super.key, required this.isLast, required this.cartEntity});
  final bool isLast;
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    var price =
        int.parse(cartEntity.productEntity.productPrice) * cartEntity.count;
    return Container(
      padding:
          const EdgeInsets.only(left: 17, right: 17, top: 3.2, bottom: 1.4),
      decoration: BoxDecoration(
        border: Border(
            top: const BorderSide(
              width: 1.3,
              color: AppColors.backgroundItemColor,
            ),
            bottom: isLast
                ? const BorderSide(
                    width: 1.3,
                    color: AppColors.backgroundItemColor,
                  )
                : BorderSide.none),
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 70,
            color: AppColors.backgroundItemColor,
            child: CachedNetworkImage(
              imageUrl: cartEntity.productEntity.imageUrl,
              placeholder: (context, url) {
                return Container(
                  height: 90,
                  width: 70,
                  color: AppColors.backgroundItemColor,
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              Text(
                cartEntity.productEntity.productName,
                style: AppStyle.fontbold13,
              ),
              const SizedBox(height: 2),
              Text(
                '${cartEntity.unit} كم',
                style: AppStyle.fontregular13.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  CustomCircularIcon(
                      icon: Iconsax.add, size: 24, onPress: () {}),
                  const SizedBox(width: 15),
                  Text('${cartEntity.count}', style: AppStyle.fontbold16),
                  const SizedBox(width: 15),
                  CustomCircularIcon(
                    icon: Iconsax.minus,
                    size: 24,
                    onPress: () {},
                    backgroundColor: AppColors.backgroundItemColor,
                    iconColor: const Color(0xff979899),
                    borderColor: const Color(0xffF1F1F5),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<CartCubit>()
                      .removeItemFromCart(cartEntity.productEntity.productCode);
                },
                child: const Icon(
                  Iconsax.trash,
                  size: 20,
                  color: Color(0xff949D9E),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '$price جنيه ',
                style: AppStyle.fontbold16.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
