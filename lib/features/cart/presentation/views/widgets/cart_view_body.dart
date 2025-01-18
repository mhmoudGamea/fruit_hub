import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/cart/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/model_views/cart_cubit/cart_state.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/check_out/presentation/views/check_out_view.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/app_bar_with_back_icon.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'cart_length_header.dart';
import 'cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        log('cart state is : $state');
      },
      builder: (context, state) {
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const AppBarWithBackIcon(),
                      const SizedBox(height: 15),
                      CartLengthHeader(
                        length: cartCubit.getCartItems.length,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                CartListView(cartEntities: cartCubit.getCartItems),
              ],
            ),
            if (cartCubit.getCartItems.isNotEmpty)
              Positioned(
                bottom: 40,
                left: 16,
                right: 16,
                child: CustomButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        CheckOutView.rn,
                        extra: OrderEntity(
                          cartEntity: cartCubit.getCartItems,
                          totalPrice: cartCubit.getTotalPriceForAllItem(),
                          uid: GetIt.instance<FirebaseAuth>().currentUser!.uid,
                        ),
                      );
                    },
                    data: 'الدفع ${cartCubit.getTotalPriceForAllItem()} جنيه'),
              ),
          ],
        );
      },
    );
  }
}
