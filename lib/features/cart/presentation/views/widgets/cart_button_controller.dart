import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../../../core/services/loading_circle.dart';
import '../../../../../core/utilies/helper.dart';
import '../../../../../core/widgets/custom_circular_icon.dart';
import '../../../domain/entity/cart_entity.dart';
import '../../model_views/cart_cubit/cart_cubit.dart';
import '../../model_views/cart_cubit/cart_state.dart';

class CartButtonController extends StatelessWidget {
  const CartButtonController({
    super.key,
    required this.cartEntity,
  });

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is ErrorMoreThan5) {
          Helper.errorMessage(context, message: 'لا يسمح بطلب أكثر من ٥ عناصر');
        } else if (state is ErrorLessThan1) {
          Helper.errorMessage(context, message: 'قم بحذف العنصر');
        }
      },
      builder: (context, state) {
        bool isLoading = false;
        if (state is IncreaseLoading &&
            state.key == ValueKey(cartEntity.productEntity.productCode)) {
          isLoading = true;
        } else if (state is DecreaseLoading &&
            state.key == ValueKey(cartEntity.productEntity.productCode)) {
          isLoading = true;
        }
        return Row(
          children: [
            CustomCircularIcon(
                icon: Iconsax.add,
                size: 24,
                onPress: () {
                  context
                      .read<CartCubit>()
                      .increaseUpdate(cartEntity.productEntity);
                }),
            const SizedBox(width: 20),
            isLoading
                ? const LoadingCircle()
                : Text('${cartEntity.count}', style: AppStyle.fontbold16),
            const SizedBox(width: 20),
            CustomCircularIcon(
              icon: Iconsax.minus,
              size: 24,
              onPress: () {
                context
                    .read<CartCubit>()
                    .decreaseUpdate(cartEntity.productEntity);
              },
              backgroundColor: AppColors.backgroundItemColor,
              iconColor: const Color(0xff979899),
              borderColor: const Color(0xffF1F1F5),
            ),
          ],
        );
      },
    );
  }
}
