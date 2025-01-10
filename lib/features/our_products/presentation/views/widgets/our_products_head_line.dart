import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_style.dart';
import '../../../../best_seller/presentation/views/best_seller_view.dart';
import 'custom_filter_icon.dart';

class OurProductsFilterHeadLine extends StatelessWidget {
  const OurProductsFilterHeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              GoRouter.of(context).push(BestSellerView.rn);
            },
            child: const Text('منتجاتنا', style: AppStyle.fontbold16)),
        const Spacer(),
        const CustomFilterIcon(),
      ],
    );
  }
}
