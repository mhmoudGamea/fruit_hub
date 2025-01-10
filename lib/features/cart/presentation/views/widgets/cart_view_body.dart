import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_list_view.dart';

import '../../../../../core/widgets/app_bar_with_back_icon.dart';
import 'cart_length_header.dart';
import 'cart_list_view_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AppBarWithBackIcon(),
                  SizedBox(height: 15),
                  CartLengthHeader(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            CartListView(),
          ],
        ),
        Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: CustomButton(onPressed: () {}, data: 'الدفع  120جنيه')),
      ],
    );
  }
}
