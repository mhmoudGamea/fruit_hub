import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../domain/entity/cart_entity.dart';
import '../../model_views/cart_cubit/cart_cubit.dart';
import 'cart_button_controller.dart';

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
                '${cartEntity.unit} كجم',
                style: AppStyle.fontregular13.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              const SizedBox(height: 6),
              CartButtonController(cartEntity: cartEntity),
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
